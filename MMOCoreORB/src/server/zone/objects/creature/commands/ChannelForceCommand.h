/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef CHANNELFORCECOMMAND_H_
#define CHANNELFORCECOMMAND_H_

#include "server/zone/objects/creature/buffs/ChannelForceBuff.h"
#include "templates/params/creature/CreatureAttribute.h"

class ChannelForceCommand : public QueueCommand {
public:

	ChannelForceCommand(const String& name, ZoneProcessServer* server)
: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (creature->hasAttackDelay())
			return GENERALERROR;


		// Bonus is in between 250-350.
		int forceRandom = System::random(100);
		int forceBonus = 250 + (forceRandom);

		ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();
		if (playerObject == NULL)
			return GENERALERROR;

		// Do not execute if the player's force bar is full.
		if (playerObject->getForcePower() >= playerObject->getForcePowerMax())
			return GENERALERROR;

		// To keep it from going over max...
		if ((playerObject->getForcePowerMax() - playerObject->getForcePower()) < forceBonus)
			forceBonus = ((playerObject->getForcePowerMax() - playerObject->getForcePower()) / 10) * 10;


		// Give Force, and subtract HAM.
		playerObject->setForcePower(playerObject->getForcePower() + forceBonus);

		// Setup buffs.

		ManagedReference<CreatureObject*> player = creature->asCreatureObject();
		player->playEffect("clienteffect/pl_force_channel.cef", "");

		return SUCCESS;
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return defaultTime * 5.0;
	}

};

#endif //CHANNELFORCECOMMAND_H_

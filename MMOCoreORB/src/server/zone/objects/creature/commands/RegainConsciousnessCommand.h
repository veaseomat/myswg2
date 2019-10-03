/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REGAINCONSCIOUSNESSCOMMAND_H_
#define REGAINCONSCIOUSNESSCOMMAND_H_

#include "server/zone/ZoneServer.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/creature/buffs/PrivateBuff.h"
#include "server/zone/objects/creature/buffs/PrivateSkillMultiplierBuff.h"

#include "JediQueueCommand.h"

class RegainConsciousnessCommand : public JediQueueCommand {
public:

	RegainConsciousnessCommand(const String& name, ZoneProcessServer* server)
	: JediQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		// They should be dead...
		if (creature->isDead()){

			int res = doCommonJediSelfChecks(creature);
			if(res != SUCCESS)
				return res;

			doForceCost(creature);

			ManagedReference<PlayerObject*> playerObject = creature->getPlayerObject();

			//close clone window
			playerObject->removeSuiBoxType(SuiWindowType::CLONE_REQUEST);

			// Revive user by setting posture to standing.
			
			creature->removeFeignedDeath();

			creature->setPosture(CreaturePosture::UPRIGHT);

			if(creature->getHAM(CreatureAttribute::HEALTH) <= 0) {
				creature->setHAM(CreatureAttribute::HEALTH, 500, true);
			}

			if(creature->getHAM(CreatureAttribute::ACTION) <= 0) {
				creature->setHAM(CreatureAttribute::ACTION, 500, true);
			}

			if(creature->getHAM(CreatureAttribute::MIND) <= 0) {
				creature->setHAM(CreatureAttribute::MIND, 500, true);
			}


			return SUCCESS;
		}

		return GENERALERROR;

	}

};

#endif //REGAINCONSCIOUSNESSCOMMAND_H_

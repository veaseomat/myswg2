/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCEARMOR1COMMAND_H_
#define FORCEARMOR1COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class ForceArmor1Command : public JediQueueCommand {
public:

	ForceArmor1Command(const String& name, ZoneProcessServer* server) : JediQueueCommand(name, server) {
		buffCRC = BuffCRC::JEDI_FORCE_ARMOR_1;
		blockingCRCs.add(BuffCRC::JEDI_FORCE_ARMOR_2);
		singleUseEventTypes.add(ObserverEventType::FORCEARMOR);
		skillMods.put("force_armor", 10);
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		return doJediSelfBuffCommand(creature);
	}

	void handleBuff(SceneObject* sceneObject, ManagedObject* object, int64 param) {
		ManagedReference<CreatureObject*> player = sceneObject->asCreatureObject();

		if (player == nullptr)
			return;

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return;

		// Client Effect upon hit (needed)
		player->playEffect("", "");

	}

};

#endif //FORCEARMOR1COMMAND_H_

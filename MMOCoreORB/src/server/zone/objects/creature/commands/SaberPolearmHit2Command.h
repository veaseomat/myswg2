/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SABERPOLEARMHIT2COMMAND_H_
#define SABERPOLEARMHIT2COMMAND_H_

#include "JediCombatQueueCommand.h"

class SaberPolearmHit2Command : public JediCombatQueueCommand {
public:

	SaberPolearmHit2Command(const String& name, ZoneProcessServer* server)
		: JediCombatQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;


		return doCombatAction(creature, target);
	}

};

#endif //SABERPOLEARMHIT2COMMAND_H_

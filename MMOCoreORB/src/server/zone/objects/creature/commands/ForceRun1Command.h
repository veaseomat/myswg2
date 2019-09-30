/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef FORCERUN1COMMAND_H_
#define FORCERUN1COMMAND_H_

#include "JediQueueCommand.h"

class ForceRun1Command : public JediQueueCommand {
public:

	ForceRun1Command(const String& name, ZoneProcessServer* server)
	: JediQueueCommand(name, server) {
		// BuffCRC's, first one is used.
		buffCRC = BuffCRC::JEDI_FORCE_RUN_1;
    
        // If these are active they will block buff use
		blockingCRCs.add(BuffCRC::JEDI_FORCE_RUN_2);
		blockingCRCs.add(BuffCRC::JEDI_FORCE_RUN_3);
    
    
		// Skill mods.
		skillMods.put("force_run", 1.5);
		skillMods.put("slope_move", 25);
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		int res = creature->hasBuff(buffCRC) ? NOSTACKJEDIBUFF : doJediSelfBuffCommand(creature);

		if (res == NOSTACKJEDIBUFF) {
			creature->sendSystemMessage("You slow down."); // You are already force running.
			creature->removeBuff(BuffCRC::JEDI_FORCE_RUN_1);
			return GENERALERROR;
		}
		// Return if something is in error.
		if (res != SUCCESS) {
			return res;
		}

		// need to apply the damage reduction in a separate buff so that the multiplication and division applies right
		Buff* buff = creature->getBuff(BuffCRC::JEDI_FORCE_RUN_2);
		if (buff == NULL)
			return GENERALERROR;


		// SPECIAL - For Force Run.
		if (creature->hasBuff(STRING_HASHCODE("burstrun")) || creature->hasBuff(STRING_HASHCODE("retreat"))) {
			creature->removeBuff(STRING_HASHCODE("burstrun"));
			creature->removeBuff(STRING_HASHCODE("retreat"));
		}

		// Return.
		return SUCCESS;
	}

};

#endif //FORCERUN1COMMAND_H_




/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef FORCERUN1COMMAND_H_
#define FORCERUN1COMMAND_H_

#include "JediQueueCommand.h"
#include "server/zone/objects/player/events/ForceRunTask.h"

class ForceRun1Command : public JediQueueCommand {
public:

	ForceRun1Command(const String& name, ZoneProcessServer* server)
	: JediQueueCommand(name, server) {
		// BuffCRC's, first one is used.
		buffCRC = BuffCRC::JEDI_FORCE_RUN_1;

        // If these are active they will block buff use
		blockingCRCs.add(BuffCRC::JEDI_FORCE_RUN_2);
		blockingCRCs.add(BuffCRC::JEDI_FORCE_RUN_3);


		// Skill mods.
		skillMods.put("force_run", 1);
		skillMods.put("slope_move", 66);
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		int res = creature->hasBuff(buffCRC) ? NOSTACKJEDIBUFF : doJediSelfBuffCommand(creature);
		/*
		if (res == NOSTACKJEDIBUFF) {
			creature->sendSystemMessage("@jedi_spam:already_force_running"); // You are already force running.
			return GENERALERROR;
		}
		*/

		// Return if something is in error.
		if (res != SUCCESS) {
			return res;
		}

		// SPECIAL - For Force Run.
		if (creature->hasBuff(STRING_HASHCODE("burstrun")) || creature->hasBuff(STRING_HASHCODE("retreat"))) {
			creature->removeBuff(STRING_HASHCODE("burstrun"));
			creature->removeBuff(STRING_HASHCODE("retreat"));
		}
		// Toggle On/Off
		if (res == NOSTACKJEDIBUFF) {
			creature->sendSystemMessage("You feel the Force leave your body, and you return to normal movement speed."); // Toggle Force Run off.
			creature->removeBuff(BuffCRC::JEDI_FORCE_RUN_1);
			return;
		}

		//Since we are going to return success, we can apply the task.
		ManagedReference<PlayerObject*> player = creature->getPlayerObject();
		Reference<ForceRunTask*> frunTask = new ForceRunTask(creature);
		creature->addPendingTask("forcerun", frunTask, 5000); //5 seconds before it starts the task.
		// Return.
		return SUCCESS;
	}

};

#endif //FORCERUN1COMMAND_H_


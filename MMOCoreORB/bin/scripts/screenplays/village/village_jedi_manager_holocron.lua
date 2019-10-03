local ObjectManager = require("managers.object.object_manager")

USEDHOLOCRON = "used_holocron"
HOLOCRONCOOLDOWNTIME = 24 * 60 * 60 * 1000 -- 24 hours

VillageJediManagerHolocron = ScreenPlay:new {}

-- Check if the player can use the holocron.
-- @param pPlayer pointer to the creature object of the player who tries to use the holocron.
-- @return true if the player can use the holocron.
function VillageJediManagerHolocron.canUseHolocron(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):isJedi() and CreatureObject(pPlayer):checkCooldownRecovery(USEDHOLOCRON)
end

-- Checks if the player can replenish the force or not.
-- @param pPlayer pointer to the creature object of the player who should be checked.
-- @return true if the player can replenish the force.
function VillageJediManagerHolocron.canReplenishForce(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):getForcePower() < PlayerObject(pGhost):getForcePowerMax()
end

-- Use the holocron on the player.
-- @param pSceneObject pointer to the scene object of the holocron.
-- @param pPlayer pointer to the creature object of the player who is using the holocron.
function VillageJediManagerHolocron.useTheHolocron(pSceneObject, pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	-- The holocrom hums softly as you feel your Force power replenish.
	

		
	if CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_03") then
	
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_master") or CreatureObject(pPlayer):hasSkill("force_rank_light_master") then
		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle("Prestige")
		sui.setPrompt("The Holocron whispers ...Death is the only the beginning...")
		sui.sendTo(pPlayer)
		end

		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_10") and not CreatureObject(pPlayer):hasSkill("force_rank_light_master") then
		awardSkill(pPlayer, "force_rank_light_master")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_09") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_10") then
		awardSkill(pPlayer, "force_rank_light_rank_10")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_08") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_09") then
		awardSkill(pPlayer, "force_rank_light_rank_09")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_07") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_08") then
		awardSkill(pPlayer, "force_rank_light_rank_08")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_06") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_07") then
		awardSkill(pPlayer, "force_rank_light_rank_07")
		end		
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_05") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_06") then
		awardSkill(pPlayer, "force_rank_light_rank_06")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_04") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_05") then
		awardSkill(pPlayer, "force_rank_light_rank_05")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_03") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_04") then
		awardSkill(pPlayer, "force_rank_light_rank_04")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_02") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_03") then
		awardSkill(pPlayer, "force_rank_light_rank_03")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_rank_01") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_02") then
		awardSkill(pPlayer, "force_rank_light_rank_02")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_light_novice") and not CreatureObject(pPlayer):hasSkill("force_rank_light_rank_01") then
		awardSkill(pPlayer, "force_rank_light_rank_01")
		end
		
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_10") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_master") then
		awardSkill(pPlayer, "force_rank_dark_master")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_09") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_10") then
		awardSkill(pPlayer, "force_rank_dark_rank_10")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_08") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_09") then
		awardSkill(pPlayer, "force_rank_dark_rank_09")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_07") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_08") then
		awardSkill(pPlayer, "force_rank_dark_rank_08")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_06") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_07") then
		awardSkill(pPlayer, "force_rank_dark_rank_07")
		end		
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_05") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_06") then
		awardSkill(pPlayer, "force_rank_dark_rank_06")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_04") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_05") then
		awardSkill(pPlayer, "force_rank_dark_rank_05")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_03") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_04") then
		awardSkill(pPlayer, "force_rank_dark_rank_04")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_02") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_03") then
		awardSkill(pPlayer, "force_rank_dark_rank_03")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_01") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_02") then
		awardSkill(pPlayer, "force_rank_dark_rank_02")
		end
		if CreatureObject(pPlayer):hasSkill("force_rank_dark_novice") and not CreatureObject(pPlayer):hasSkill("force_rank_dark_rank_01") then
		awardSkill(pPlayer, "force_rank_dark_rank_01")
		end		


	SceneObject(pSceneObject):destroyObjectFromWorld()
	SceneObject(pSceneObject):destroyObjectFromDatabase()
	CreatureObject(pPlayer):sendSystemMessage("The Holocron hums softly and begins to glow! You feel a rush of ancient knowledge flood your senses.")

	else
		CreatureObject(pPlayer):sendSystemMessage("The Holocron hums briefly but otherwise does nothing. Only a Jedi Knight can access the knowledge within.")
	end
	
end

-- Send message to the player that he cannot replenish the force.
-- @param pPlayer pointer to the creature object of the player that tries to use the holocron.
function VillageJediManagerHolocron.cannotReplenishForce(pPlayer)
	-- You are already at your maximum Force power.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_force_max")
end

-- Send message to the player that he cannot use the holocron.
-- @param pPlayer pointer to the creature object of the player that tries to use the holocron.
function VillageJediManagerHolocron.cannotUseHolocron(pPlayer)
	-- The holocron hums briefly, but otherwise does nothing.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_no_effect")
end

-- Handling of the useHolocron event.
-- @param pSceneObject pointer to the holocron object.
-- @param pPlayer pointer to the creature object that used the holocron.
function VillageJediManagerHolocron.useHolocron(pSceneObject, pPlayer)
	VillageJediManagerHolocron.useTheHolocron(pSceneObject, pPlayer)
end

return VillageJediManagerHolocron

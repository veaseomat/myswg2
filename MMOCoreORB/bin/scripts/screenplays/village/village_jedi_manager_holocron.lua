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
		local playerCouncil = JediTrials:getJediCouncil(pPlayer)
	
		if playerCouncil == JediTrials.COUNCIL_LIGHT and not CreatureObject(pPlayer):hasSkill("force_rank_light_novice") then
			local sui = SuiMessageBox.new("KnightTrials", "noCallback")
			sui.setTitle("FRS UNLOCK")
			sui.setPrompt("Welcome to the Force ranking system. Completing BH missions and using more holocrons will earn FRS exp. You can learn FRS skills from trainers. There are also wild spawn dark jedi sentinels on every planet that drop higher tier loot when you are strong enough.")
			sui.sendTo(pPlayer)
		awardSkill(pPlayer, "force_rank_light_novice")
		end

		if playerCouncil == JediTrials.COUNCIL_DARK and not CreatureObject(pPlayer):hasSkill("force_rank_dark_novice") then
			local sui = SuiMessageBox.new("KnightTrials", "noCallback")
			sui.setTitle("FRS UNLOCK")
			sui.setPrompt("Welcome to the Force ranking system. Completing BH missions and using more holocrons will earn FRS exp. You can learn FRS skills from trainers. There are also wild spawn dark jedi sentinels on every planet that drop higher tier loot when you are strong enough.")
			sui.sendTo(pPlayer)
		awardSkill(pPlayer, "force_rank_dark_novice")	
		end		

	CreatureObject(pPlayer):awardExperience("force_rank_xp", 5000, true)		

	SceneObject(pSceneObject):destroyObjectFromWorld()
	SceneObject(pSceneObject):destroyObjectFromDatabase()
	CreatureObject(pPlayer):sendSystemMessage("The Holocron hums softly and begins to glow! You have absorbed the ancient knowledge of the holocron.")

	else
		CreatureObject(pPlayer):sendSystemMessage("The Holocron hums briefly but does nothing. Only a Jedi Knight can access the knowledge within.")
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

local ObjectManager = require("managers.object.object_manager")
local Logger = require("utils.logger")

Glowing = ScreenPlay:new {
	requiredBadges = {
		{ type = "exploration_jedi", amount = 0 },
		{ type = "exploration_dangerous", amount = 0 },
		{ type = "exploration_easy", amount = 0 },
		{ type = "master", amount = 0 },
		{ type = "content", amount = 0 },
	}
}

function Glowing:getCompletedBadgeTypeCount(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return 0
	end

	local typesCompleted = 0

	for i = 1, #self.requiredBadges, 1 do
		local type = self.requiredBadges[i].type
		local requiredAmount = self.requiredBadges[i].amount

		local badgeListByType = getBadgeListByType(type)
		local badgeCount = 0

		for j = 1, #badgeListByType, 1 do
			if PlayerObject(pGhost):hasBadge(badgeListByType[j]) then
				badgeCount = badgeCount + 1
			end
		end

		if badgeCount >= requiredAmount then
			typesCompleted = typesCompleted + 1
		end
	end

	return typesCompleted
end

function Glowing:hasRequiredBadgeCount(pPlayer)
	return self:getCompletedBadgeTypeCount(pPlayer) == #self.requiredBadges
end

-- Check if the player is glowing or not.
-- @param pPlayer pointer to the creature object of the player.
function Glowing:isGlowing(pPlayer)
	return VillageJediManagerCommon.hasJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_GLOWING)
end

-- Event handler for the BADGEAWARDED event.
-- @param pPlayer pointer to the creature object of the player who was awarded with a badge.
-- @param pPlayer2 pointer to the creature object of the player who was awarded with a badge.
-- @param badgeNumber the badge number that was awarded.
-- @return 0 to keep the observer active.
function Glowing:badgeAwardedEventHandler(pPlayer, pPlayer2, badgeNumber)
	if (pPlayer == nil) then
		return 0
	end

	if self:hasRequiredBadgeCount(pPlayer) and not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice") then
		VillageJediManagerCommon.setJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_GLOWING)
		FsIntro:startPlayerOnIntro(pPlayer)
		return 1
	end

	return 0
end

-- Register observer on the player for observing badge awards.
-- @param pPlayer pointer to the creature object of the player to register observers on.
function Glowing:registerObservers(pPlayer)
	dropObserver(BADGEAWARDED, "Glowing", "badgeAwardedEventHandler", pPlayer)
	createObserver(BADGEAWARDED, "Glowing", "badgeAwardedEventHandler", pPlayer)
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pPlayer pointer to the creature object of the player who logged in.
function Glowing:onPlayerLoggedIn(pPlayer)
	if self:hasRequiredBadgeCount(pPlayer) and not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice") then
		FsIntro:completeVillageIntroFrog(pPlayer)
		FsOutro:completeVillageOutroFrog(pPlayer)
		JediTrials:completePadawanForTesting(pPlayer)
		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle("Jedi Unlock")
		sui.setPrompt("Welcome Padawan. To begin your journey you must first locate a color crystal and tune it. Meatlumps outside coronet, corellia are a great place to loot color and power crystals. Then you will need to craft a lightsaber to being grinding. Once you have mastered all 5 jedi professions you can become a Jedi Knight. Jedi Knights become extremely powerful here! May the force be with you. (check your email for some helpful starting tips)")
		sui.sendTo(pPlayer)
		sendMail("mySWG", "Welcome Jedi", "Welcome to mySWG. There are countless changes and I'm only going to outline a few here to set you up for success. Starting out you should go to coronet first to kill meatlumps with your fists until you loot a color crystal (it wont take long), then craft a lightsaber. use the resource kit to get the materials you need (resource stats dont matter, sabers have fixed stats). Once you have a lightsaber its time to grind, you can take 4 missions at a time. All skill trainers teach jedi skills. since there are no vehicles here burst run is your friend (2min run, 1min cooldown). All saber styles are equal and all have a spin attack (1h combo hit, 2h sweep), althrough I recommend using single stat hits at least until 2nd gen saber. combat mechanics have been completely overhauled here. intimidate and stun are the only 2 states. dizzy and blind have have both been changed to apply stun. stun reduces damage 10% and intimidate reduces damage 20%. All jedi skills and abilities have been reworked in some way, theyre fairly intuitive just experiment a little (descriptions are not correct). There is no XP loss. wounds can be healed by standing inside a medical facility or cantina. sitting will help regen your HAM and force bar. armor has no stats and can be worn. all wearables can be recolored. Master all 5 professions and you can become a knight. Once you are a knight you can use the BH terminals, loot BH droids from the BH NPCs located in cities. FRS terminals are disabled, learn FRS skills from trainers. Earn frs exp from holocrons, frs player kills, and bh missions. The goal here is simplicity. Combat has been smoothed out, the grind has been smoothed out. mySWG is about the feel of the game and giving the player a natural rate of progression. Every skill box helps your characters innate stats grow, you wont see it in your skill mods list because its done through the game mechanics (this is so no patch is required). Welcome to mySWG.", CreatureObject(pPlayer):getFirstName())
	end
end

-- Handling of the checkForceStatus command.
-- @param pPlayer pointer to the creature object of the player who performed the command
function Glowing:checkForceStatusCommand(pPlayer)
	local progress = "@jedi_spam:fs_progress_" .. self:getCompletedBadgeTypeCount(pPlayer)

	CreatureObject(pPlayer):sendSystemMessage(progress)
end

return Glowing

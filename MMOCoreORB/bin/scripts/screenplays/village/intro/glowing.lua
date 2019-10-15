local ObjectManager = require("managers.object.object_manager")
local Logger = require("utils.logger")

Glowing = ScreenPlay:new {
	requiredBadges = {
		{ type = "exploration_jedi", amount = 3 },
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
		FsIntro:completeVillageIntroFrog(pPlayer)
		FsOutro:completeVillageOutroFrog(pPlayer)
		JediTrials:completePadawanForTesting(pPlayer)
		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle("Jedi Unlock")
		sui.setPrompt("Welcome Padawan. To begin your journey you must first craft a lightsaber. There is no reason to visit a shrine. use /findmytrainer to locate your jedi skill trainer. May the force be with you. \n(read the welcome/login email for some helpful tips!)")
		sui.sendTo(pPlayer)
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
		sendMail("mySWG", "Welcome/Login Mail 10/14/2019", "Welcome to mySWG.\n\n"
		.."NEW PLAYER INFO:"
		.."\n**WARNING** UNLOCKING JEDI will surrender all of your skills and make your character permanently a jedi and unable to learn non jedi skills."
		.."\n-Unlock jedi by visiting 3 jedi POI then type /checkforce (ben kenobis home on tatooine, jedi temple on dantooine, exar kun temple on yavin4)."
		.."\n-Use the /findmytrainer to locate your jedi skill trainer."
		.."\n\nTHE KNIGHTLY KNEWS:"
		.."\n-The Old Man has been spotted on easy planets. Rumor has it he stole a holocron from the village, take him down. (100% holo drop)"
		.."\n-Dark Jedi Adepts, Knights, Masters found on hard planets drop holocrons."
		.."\n-Dark Jedi Sentinels found on hard planets drop extra powerful lightsabers."
		.."\n-The following creatures drop holocrons: Peko Peko Albatross on Naboo, Graul Marauder on Dantooine."
		.."\n\nTHE CHANGES:"
		.."\n5char, 2char online per account, multi accounts will get you banned"
		.."\ninfinite skill points, jedi cant learn non jedi skills"
		.."\njedi XP is 10x"
		.."\nnon jedi xp is 20x"
		.."\ncrafting xp is 100x"
		.."\nspin groups enabled here, 1hit gives full xp"
		.."\nNO XP LOSS"
		.."\nno exceptional/legendary items"
		.."\ncrafting times removed"
		.."\nfactory times reduced"
		.."\ncities and building on ANY planet"
		.."\nreduced maintenance costs"
		.."\nDWB entry doesnt require boba fett"
		.."\nDWB droids drop SEA"
		.."\nclothing/armor 10 sockets each"
		.."\nall wearables can be color changed"
		.."\narmor has no encumbrance"
		.."\nbazaar 1000 items @ 999m max"
		.."\nspeeder and house can be bought with faction points"
		.."\nno adk"
		.."\nsitting regens ham 3x, force 2x"
		.."\nmed centers / cantinas heal wounds"
		.."\nplayer can have 5 faction pets, no atst"
		.."\n\nJEDI:"		
		.."\nsaber styles balanced and any saber type can use ANY saber special."
		.."\nall sabers styles have cone attack for leveling(1h combo, 2h sweep, dbl spin; dervish tier are 360 aoe)"
		.."\ncrafted lightsabers fixed stats"
		.."\ncrystals completely redone, only add damage, tune based on quality, no crystal decay"
		.."\ninstant knight trial completion"
		.."\nFRS rank 11 knights that die and clone will *prestige*, lose all skills and start over with permanent skill mod increase (allows for infinite leveling)"
		.."\nFRS light and dark side balanced"
		.."\nFRS boxes are learned from holocrons"
		.."\nHolocrons can be looted from specific mobs listed in login email"
		.."\nDJM drop random stat 4th gen lightsabers that are better than crafted"
		.."\nknights can use bh terminals"
		.."\n\n The goal here is simplicity. Combat has been smoothed out, the grind has been smoothed out. mySWG is about the feel of the game and giving the player a natural rate of progression. In vanilla SWG jedi ramp up from weak to OP exponentially because thats how the skill trees are built, I've essentially tried to reverse that so we start with a strong base and slowly build up to tank monsters endgame."
		.."\n\n Welcome to mySWG,\n-Veaseomat\n\n *This mail will be received every login, check here for changes!", CreatureObject(pPlayer):getFirstName())

	if self:hasRequiredBadgeCount(pPlayer) and not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice") then
		FsIntro:completeVillageIntroFrog(pPlayer)
		FsOutro:completeVillageOutroFrog(pPlayer)
		JediTrials:completePadawanForTesting(pPlayer)
		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle("Jedi Unlock")
		sui.setPrompt("Welcome Padawan. To begin your journey you must first craft a lightsaber. There is no reason to visit a shrine. use /findmytrainer to locate your jedi skill trainer. May the force be with you. \n(read the welcome/login email for some helpful tips!)")
		sui.sendTo(pPlayer)
	end
end

-- Handling of the checkForceStatus command.
-- @param pPlayer pointer to the creature object of the player who performed the command
function Glowing:checkForceStatusCommand(pPlayer)
	local progress = "@jedi_spam:fs_progress_" .. self:getCompletedBadgeTypeCount(pPlayer)

	if self:hasRequiredBadgeCount(pPlayer) and not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice") then
		FsIntro:completeVillageIntroFrog(pPlayer)
		FsOutro:completeVillageOutroFrog(pPlayer)
		JediTrials:completePadawanForTesting(pPlayer)
		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle("Jedi Unlock")
		sui.setPrompt("Welcome Padawan. To begin your journey you must first craft a lightsaber. There is no reason to visit a shrine. use /findmytrainer to locate your jedi skill trainer. May the force be with you. \n(read the welcome/login email for some helpful tips!)")
		sui.sendTo(pPlayer)
	end
end

return Glowing

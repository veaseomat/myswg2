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
		sendMail("mySWG", "Welcome/Updates Mail", "Welcome to mySWG.\n\n"
		.."NEW PLAYER INFO:"
		.."\n-**WARNING** UNLOCKING JEDI will surrender all of your skills and make your character permanently a jedi and unable to learn non jedi skills.\n-Unlock jedi by visiting 3 jedi POI then type /checkforce (ben kenobis home on tatooine, jedi temple on dantooine, exar kun temple on yavin4)."
		.."\n-Use the /findmytrainer to locate your jedi skill trainer."
		.."\n\nTHE KNIGHTLY KNEWS:"
		.."\n-The Old Man has been spotted on easy planets. Rumor has it he stole a holocron from the village, take him down. (100% holo drop)"
		.."\n-Dark Jedi Masters inhabit hard planets, They carry holocrons and extra powerful lightsabers, approach with caution. (100% holo drop, 50% saber drop)"
		.."\n-The following creatures drop holocrons: Peko Peko Albatross on Naboo, Graul Marauder on Dantooine, Ancient Bull Rancor on Dathomir, Blurrg Raptor on Endor, Enraged Kimogila on Lok, Stintaril Prowler on Yavin4.(all 50% holo drop)"
		.."\n\nTHE CHANGES:"
		.."\n-Infinite skill points."
		.."\n-Jedi can not learn non jedi skills and vice versa."
		.."\n-Lightsabers have fixed stats."
		.."\n-You can take 4 missions at a time."
		.."\n-You can buy a speeder and house with faction points."
		.."\n-Burst run is 2min, 1min cooldown."
		.."\n-All saber styles are equal and all have a cone attack for leveling (1h combo hit, 2h sweep, dbl spin)."
		.."\n-All jedi skills and abilities have been reworked in some way, descriptions not always correct, The facebook page will have skill tree infographics."
		.."\n-There is no XP loss."
		.."\n-Wounds can be healed by standing inside a medical facility or cantina."
		.."\n-Sitting will help regen your HAM and force bar."
		.."\n-There are no exceptional/legendary items."
		.."\n-Armor has no encumbrance."
		.."\n-All wearables can be recolored."
		.."\n-All weapons are certified, all weapons are medium armor piercing."
		.."\n-Please use Auction Chat tab as the global chat and add it to your spatial."
		.."\n-Shrines give FRS robes to correct FRS rank."
		.."\n-Jedi knight requires 2 4th boxes and 206 skill points spent like vanilla. Once you are a knight you can use the Bounty Hunter terminals, loot BH droids from the BH NPCs located in cities. FRS terminals are disabled, learn FRS skills from HOLOCRONS."
		.."\n-Once a player reaches Force Ranking System rank 11 (top box), if they die and clone they will *Prestige*. This means they LOSE ALL THEIR SKILLS but start over with a small permanent skill boost, what this does is allow for infinite progression. You also get a * added to your name each time so other players can see how many times you have prestiged."
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

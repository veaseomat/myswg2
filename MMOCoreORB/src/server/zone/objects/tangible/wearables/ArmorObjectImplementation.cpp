/*
 * ArmorObjectImplementation.cpp
 *
 *  Created on: 02/08/2009
 *      Author: victor
 */

#include "server/zone/objects/tangible/wearables/ArmorObject.h"
#include "templates/tangible/ArmorObjectTemplate.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"
#include "templates/tangible/SharedWeaponObjectTemplate.h"

void ArmorObjectImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	setLoggingName("ArmorObject");
}

void ArmorObjectImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	WearableObjectImplementation::loadTemplateData(templateData);

		return;

}

void ArmorObjectImplementation::notifyLoadFromDatabase() {
	WearableObjectImplementation::notifyLoadFromDatabase();

	if (templateObject == NULL)
		return;

	if (rating != LIGHT && templateObject->getClientTemplateFileName().contains("armor_bounty_hunter_"))
		rating = LIGHT;
}

void ArmorObjectImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	WearableObjectImplementation::fillAttributeList(alm, object);

	//Armor Rating


	//Check for special protections


}

bool ArmorObjectImplementation::isVulnerable(int type) {
	return isBroken() || (!isSpecial(type) && (vulnerabilites & type));
}

float ArmorObjectImplementation::getTypeValue(int type, float value) {

	int newValue = 0;

	if(vulnerabilites & type)
		newValue = value;

	else if(isSpecial(type)) {
		newValue = specialProtection + value;
		if(newValue > 0)
			newValue = 0;
	} else {
		newValue = baseProtection + value;
		newValue *= effectivenessSlice;

		if(sliced && effectivenessSlice > 1) {
			if(newValue > 0)
				newValue = 0;
		} else {
			if(newValue > 0)
				newValue = 0;
		}
	}

	return newValue;
}

int ArmorObjectImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	if (selectedID == 69 && player->hasSkill("combat_smuggler_slicing_03")) {
		if (isSliced()) {
			player->sendSystemMessage("@slicing/slicing:already_sliced");
			return 0;
		}

		ManagedReference<Facade*> facade = player->getActiveSession(SessionFacadeType::SLICING);
		ManagedReference<SlicingSession*> session = dynamic_cast<SlicingSession*>(facade.get());

		if (session != NULL) {
			player->sendSystemMessage("@slicing/slicing:already_slicing");
			return 0;
		}

		//Create Session
		session = new SlicingSession(player);
		session->initalizeSlicingMenu(player, _this.getReferenceUnsafeStaticCast());

		return 0;

	} else
		return TangibleObjectImplementation::handleObjectMenuSelect(player, selectedID);
}

void ArmorObjectImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {

	WearableObjectImplementation::updateCraftingValues(values, firstUpdate);

	/*
	 * Incoming Values:					Ranges:
	 * sockets							All depend on type of armor
	 * hit_points
	 * armor_effectiveness
	 * armor_integrity
	 * armor_health_encumbrance
	 * armor_action_encumbrance
	 * armor_mind_encumbrance
	 * armor_rating
	 * armor_special_type
	 * armor_special_effectiveness
	 * armor_special_integrity
	 */
	//craftingValues->toString();

	if(firstUpdate) {

		kinetic = 0;
		energy = 0;
		electricity = 0;
		stun = 0;
		blast = 0;
		heat = 0;
		cold = 0;
		acid = 0;
		lightSaber = 0;
		baseProtection = 0;
		specialProtection = 0;
		effectivenessSlice = 1;
		encumbranceSlice = 1;

		calculateSpecialProtection(values);

		setRating((int) values->getCurrentValue("armor_rating"));

		setConditionDamage(0);
	}

	setHealthEncumbrance((int) values->getCurrentValue(
			"armor_health_encumbrance"));
	setActionEncumbrance((int) values->getCurrentValue(
			"armor_action_encumbrance"));
	setMindEncumbrance((int) values->getCurrentValue(
			"armor_mind_encumbrance"));

	setMaxCondition((int) values->getCurrentValue("armor_integrity"));

	baseProtection = values->getCurrentValue("armor_effectiveness");

	/// Because SOE had to be stupid and not make the rules consistant
	if(values->getMaxValue("armor_special_effectiveness") == values->getMinValue("armor_special_effectiveness"))
		specialProtection = values->getCurrentValue("armor_effectiveness");
	else
		specialProtection = values->getCurrentValue("armor_special_effectiveness");

}

void ArmorObjectImplementation::calculateSpecialProtection(CraftingValues* craftingValues) {
	specialResists = ((int)(craftingValues->getCurrentValue("armor_special_type")));

	for (int i = 0; i <= 8; ++i) {
		int type = pow((float)2,i);

		String subtitle = getStringType(type);
		float value = craftingValues->getCurrentValue(subtitle);

		if (value != ValuesMap::VALUENOTFOUND) {
			specialResists |= type;
			setProtectionValue(type, value);
		}
	}
}

String ArmorObjectImplementation::getStringType(int type) {

	switch(type) {
	case SharedWeaponObjectTemplate::KINETIC:
		return "kineticeffectiveness";
		break;
	case SharedWeaponObjectTemplate::ENERGY:
		return "energyeffectiveness";
	break;
	case SharedWeaponObjectTemplate::ELECTRICITY:
		return "electricaleffectiveness";
		break;
	case SharedWeaponObjectTemplate::STUN:
		return "stuneffectiveness";
		break;
	case SharedWeaponObjectTemplate::BLAST:
		return "blasteffectiveness";
		break;
	case SharedWeaponObjectTemplate::HEAT:
		return "heateffectiveness";
		break;
	case SharedWeaponObjectTemplate::COLD:
		return "coldeffectiveness";
		break;
	case SharedWeaponObjectTemplate::ACID:
		return "acideffectiveness";
		break;
	case SharedWeaponObjectTemplate::LIGHTSABER:
		return "restraineffectiveness";
		break;
	default:
		return "";
	}
}

float ArmorObjectImplementation::getKinetic() {
	float value = getTypeValue(SharedWeaponObjectTemplate::KINETIC, kinetic);
	return value - getConditionReduction(value);
}

float ArmorObjectImplementation::getEnergy() {
	float value = getTypeValue(SharedWeaponObjectTemplate::ENERGY, energy);
	return value - getConditionReduction(value);
}
float ArmorObjectImplementation::getElectricity() {
	float value = getTypeValue(SharedWeaponObjectTemplate::ELECTRICITY, electricity);
	return value - getConditionReduction(value);
}
float ArmorObjectImplementation::getStun() {
	float value = getTypeValue(SharedWeaponObjectTemplate::STUN, stun);
	return value - getConditionReduction(value);
}

float ArmorObjectImplementation::getBlast() {
	float value = getTypeValue(SharedWeaponObjectTemplate::BLAST, blast);
	return value - getConditionReduction(value);
}
float ArmorObjectImplementation::getHeat() {
	float value = getTypeValue(SharedWeaponObjectTemplate::HEAT, heat);
	return value - getConditionReduction(value);
}

float ArmorObjectImplementation::getCold() {
	float value = getTypeValue(SharedWeaponObjectTemplate::COLD, cold);
	return value - getConditionReduction(value);
}

float ArmorObjectImplementation::getAcid() {
	float value = getTypeValue(SharedWeaponObjectTemplate::ACID, acid);
	return value - getConditionReduction(value);
}

float ArmorObjectImplementation::getLightSaber() {
	float value = getTypeValue(SharedWeaponObjectTemplate::LIGHTSABER, lightSaber);
	return value - getConditionReduction(value);
}


void ArmorObjectImplementation::setProtectionValue(int type, float value) {

	if (type & SharedWeaponObjectTemplate::KINETIC)
		setKinetic(value);
	if (type & SharedWeaponObjectTemplate::ENERGY)
		setEnergy(value);
	if (type & SharedWeaponObjectTemplate::BLAST)
		setBlast(value);
	if (type & SharedWeaponObjectTemplate::STUN)
		setStun(value);
	if (type & SharedWeaponObjectTemplate::LIGHTSABER)
		setLightSaber(value);
	if (type & SharedWeaponObjectTemplate::HEAT)
		setHeat(value);
	if (type & SharedWeaponObjectTemplate::COLD)
		setCold(value);
	if (type & SharedWeaponObjectTemplate::ACID)
		setAcid(value);
	if (type & SharedWeaponObjectTemplate::ELECTRICITY)
		setElectricity(value);
}

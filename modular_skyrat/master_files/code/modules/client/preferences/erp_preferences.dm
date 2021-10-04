/datum/config_entry/flag/disable_erp_preferences
	default = FALSE

/datum/preference/toggle/master_erp_preferences
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "master_erp_pref"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = TRUE

/datum/preference/toggle/master_erp_preferences/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return TRUE

/datum/preference/toggle/erp
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_identifier = PREFERENCE_PLAYER
	savefile_key = "erp_pref"
	default_value = FALSE

/datum/preference/toggle/erp/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_erp_preferences)

/datum/preference/toggle/erp/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE
	if(!preferences.read_preference(/datum/preference/toggle/master_erp_preferences))
		return FALSE
	. = ..()

/datum/preference/toggle/erp/cum_face
	savefile_key = "cum_face_pref"

/datum/preference/toggle/erp/sex_toy
	savefile_key = "sextoy_pref"

/datum/preference/toggle/erp/bimbofication
	savefile_key = "bimbofication_pref"

/datum/preference/toggle/erp/aphro
	savefile_key = "aphro_pref"

/datum/preference/toggle/erp/breast_enlargement
	savefile_key = "breast_enlargement_pref"

/datum/preference/toggle/erp/penis_enlargement
	savefile_key = "penis_enlargement_pref"

/datum/preference/toggle/erp/gender_change
	savefile_key = "gender_change_pref"

/datum/preference/toggle/erp/noncon
	savefile_key = "noncon_pref"

/datum/preference/choiced/erp_status
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status_pref"

/datum/preference/choiced/erp_status/init_possible_values()
	return list("Yes", "Ask", "Check OOC", "No")

/datum/preference/choiced/erp_status/create_default_value()
	return "Ask"

/datum/preference/choiced/erp_status/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_erp_preferences)

/datum/preference/choiced/erp_status/deserialize(input, datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_erp_preferences))
		return "disabled"
	if(!preferences.read_preference(/datum/preference/toggle/master_erp_preferences))
		return "disabled"
	. = ..()

/datum/preference/choiced/erp_status/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

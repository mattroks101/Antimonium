/obj/item/limb
	name = "limb"
	icon = 'icons/objects/items/limbs/_default.dmi'
	contact_size = 5
	weight = 10
	sharpness = 1
	attack_verbs = list("bludgeons", "batters", "whacks")

	var/root_limb = FALSE
	var/limb_id
	var/mob/human/owner
	var/obj/item/limb/parent
	var/list/children = list()
	var/vital = FALSE

/obj/item/limb/get_inv_icon()
	return get_worn_icon("world")

/obj/item/limb/New(var/mob/human/_owner, var/_name, var/_icon, var/_limb_id, var/_parent, var/_root, var/_vital, var/_size)
	..()
	owner = _owner
	name = _name
	icon = _icon
	limb_id = _limb_id
	vital = _vital
	root_limb = _root

	contact_size = _size      // Reusing contact_size as an 'effective limb
	weight = (contact_size*2) // size' for the purposes of bleeding etc.

	if(_parent)
		parent = owner.limbs[_parent]
		parent.children += src

/obj/item/limb/proc/is_bleeding()
	if(wounds.len)
		for(var/thing in wounds)
			var/data/wound/wound = thing
			if(wound.wound_type == WOUND_CUT && wound.bleed_amount)
				return TRUE
	return FALSE

/obj/structure/brazier
	name = "brazier"
	icon = 'icons/structure/brazier.dmi'
	anchored = FALSE

	light_color = BRIGHT_ORANGE
	light_power = 10
	light_range = 5

/obj/structure/brazier/New()
	..()
	set_light()

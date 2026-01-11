if (keyboard_check(vk_escape))
	instance_create_layer(0, 0, "Instances", obj_room_transition, {reverse: false, target_room: rm_room})

if (keyboard_check(vk_enter))
{
	global.resolving = true
}
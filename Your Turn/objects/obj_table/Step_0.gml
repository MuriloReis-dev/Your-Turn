if (!global.lock_controls)
{
	if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
	{
		instance_create_layer(0, 0, "Instances", obj_room_transition, {reverse: false, target_room: rm_table})
	}
}
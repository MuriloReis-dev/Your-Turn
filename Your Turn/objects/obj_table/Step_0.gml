
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	var transition = instance_find(obj_room_transition, 0)
	if (transition != noone)
	{
		transition.sprite = spr_blink
		transition.target_room = rm_table
		transition.active = true
	}
}
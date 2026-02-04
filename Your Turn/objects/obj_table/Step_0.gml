
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	with (obj_game_controller)
	{
		event_args.trg_room = rm_table
		event_user(0)
	}
}
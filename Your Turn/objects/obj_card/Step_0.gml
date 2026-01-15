if (!in_action)
{
	card_animation(id, target_x, target_y, target_rot, spd) // animação de movimento

	#region Depth
	var i = array_find_index(global.draggable_instances, function (value, index)
	{
		if (value == id)
			return true
		return false
	})

	depth = -i
	#endregion

	if (!played)
	{
		

		#region Resetar Posições
		if (keyboard_check(ord("R")))
		{
			if (!on_slot)
			{
				// reorganiza a array para consertar depths
				array_sort(global.draggable_instances, function(elm1, elm2) {
					return elm1.inst_id - elm2.inst_id
				})
		
				target_x = card_pos.x_pos
				target_y = card_pos.y_pos
			}
		}
		#endregion
	}
}

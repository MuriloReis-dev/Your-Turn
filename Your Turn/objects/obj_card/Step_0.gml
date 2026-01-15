

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

	#region Clique Inicial
	if (mouse_check_button_pressed(mb_left))
	{
		// verifica se é a carta mais ao topo
		var card = get_inst_on_top(obj_card)
	
		if (card == id)
		{
			// coloca a carta na layer acima das outras cartas
			array_delete(global.draggable_instances, array_get_index(global.draggable_instances, id), 1);
			array_push(global.draggable_instances, id);
		
			dragging = true
			drag_offset_x = x - mouse_x
			drag_offset_y = y - mouse_y
		}
	}
	#endregion

	#region Arrastando
	if (dragging) {
		on_slot = false
	    x = mouse_x + drag_offset_x
	    y = mouse_y + drag_offset_y
	}
	#endregion

	#region Soltando
	if (mouse_check_button_released(mb_left))
	{
		if (dragging)
		{
			xstart = x; target_x = x;
			ystart = y; target_y = y;

			var space = instance_position(x, y, obj_card_slot)
			
			if (instance_exists(space) && space.card == noone)
			{
				target_x = space.x
				target_y = space.y
				
				space.card = id
				on_slot = true
			}
	
			dragging = false
		}
	}
	#endregion

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

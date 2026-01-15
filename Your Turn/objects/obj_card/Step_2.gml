if (!in_action && !played)
{
	#region Clique Inicial
	if (mouse_check_button_pressed(mb_left))
	{
		if (selected)
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
	if (dragging)
	{
		on_slot = false
		x = mouse_x + drag_offset_x
		y = mouse_y + drag_offset_y
		depth = -150
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
}

// indicador visual de seleção da carta
image_xscale = selected ? 1.1 : 1
image_yscale = image_xscale
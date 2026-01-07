array_foreach(global.cards, function (el, i)
{
	el.depth = -i
})

// Clique inicial
if (mouse_check_button_pressed(mb_left))
{
	// verifica se é a carta mais ao topo
	var card = noone
	var card_depth = infinity
	with (obj_card)
	{
		if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
		{
			if (depth < card_depth)
			{
				card = id
				card_depth = depth
			}
		}
	}
	
	if (card != noone)
	{
		with (card)
		{
			// coloca a carta na layer acima das outras cartas
			array_delete(global.cards, array_get_index(global.cards, id), 1);
			array_push(global.cards, id);
		
		    dragging = true
		    drag_offset_x = x - mouse_x
		    drag_offset_y = y - mouse_y
		}
	}
}

// Soltar
if (mouse_check_button_released(mb_left))
{
	with (obj_card)
	{
		dragging = false
	}
}


if (keyboard_check_pressed(vk_escape))
	instance_create_layer(0, 0, "Instances", obj_room_transition, {reverse: false, target_room: rm_room})

if (keyboard_check_pressed(vk_enter))
{
	global.resolving = true
	
	for (var row = 0; row < array_length(global.board); row++)
	{
		for (var col = 0; col < array_length(global.board[row]); col++)
		{
			var card_slot = global.board[row][col]
			var card = card_slot.card
			if (card != noone)
			{
				var adj = get_adjacent_slots(card_slot.slot[0], card_slot.slot[1])
			
				for (var i = 0; i < array_length(adj); i++)
				{
					// direção da inclinação de ataque
					var this_slot = card_slot.slot
					var target_slot = adj[i].slot
					
					var rot_dir = 0
					
					if (this_slot[0] == target_slot[0]) // está na mesma linha
						rot_dir = sign(this_slot[1] - target_slot[1] )
					else if (this_slot[1] == target_slot[1]) // está na mesma coluna
						rot_dir = sign(this_slot[0] - target_slot[0]) * (this_slot[1] - 1)
					
					// adiciona ataque à fila de ações
					var target = adj[i].card
					if (target != noone)
						ds_queue_enqueue(global.action_queue, Action_attack(card, target, 20 * rot_dir))
				}
			}
		}
	}
}
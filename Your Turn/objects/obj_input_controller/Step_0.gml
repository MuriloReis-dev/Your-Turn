
#region Iniciar Turno
if (keyboard_check_pressed(vk_enter))
{
	var fila = ds_queue_create() // fila de ações de ataque
	
	for (var row = 0; row < array_length(global.board); row++)
	{
		for (var col = 0; col < array_length(global.board[row]); col++)
		{
			var card_slot = global.board[row][col]
			var card = card_slot.card
			if (card != noone)
			{
				card.played = true // define carta como jogada
				
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
					if (target != noone && target.owner != card.owner)
						ds_queue_enqueue(fila, new Action_attack(card, target, 20 * rot_dir))
				}
			}
		}
	}
	
	// cria ação final para desbloquear controles
	ds_queue_enqueue(fila, create_action(function(){ global.lock_controls = false }))
	
	// inicia fila de ações
	array_push(global.action_groups, new Action_group(fila))
}
#endregion
	
	

input = {
	interact: mouse_check_button(mb_left),
	go_back: keyboard_check_pressed(vk_escape),
	confirm: keyboard_check_pressed(vk_enter),
	rules_book: keyboard_check_pressed(vk_tab)
}

if (input.interact)
{
	
}

if (input.go_back)
{
	with (obj_game_controller)
	{
		event_args.trg_room = rm_room
		event_user(0)
	}
}

if (input.confirm)
{
	
}

if (input.rules_book)
{
	with (obj_rules_book)
	{
		visible = !visible
	}
}
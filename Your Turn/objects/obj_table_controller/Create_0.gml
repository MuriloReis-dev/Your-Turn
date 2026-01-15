#region Globais

global.draggable_instances = [] // array que guarda instâncias arrastáveis

global.board = []

global.deck = {x_pos: 2010, y_pos: 540}

global.player_hand = []
global.opponent_hand = []

global.resolving = false

#endregion

#region Criação das Instâncias

// Slots
var board_length = [3, 3]

var board_pos = {x_pos: 768, y_pos: 228}

var xspacing = 192
var yspacing = 312

for (var row = 0; row < board_length[0]; row++)
{
	for (var col = 0; col < board_length[1]; col++)
	{
		var slot_x = board_pos.x_pos + col * xspacing
		var slot_y = board_pos.y_pos + row * yspacing
		
		var inst = instance_create_layer(slot_x, slot_y, "Instances", obj_card_slot, {slot: [row, col]})
		
		global.board[row][col] = inst
	}
	
}


// Cartas
var hand_length = [5, 1] // Máximo de cartas na mão

var player_hand_pos = {x_pos: 1395, y_pos: 930}
var opponent_hand_pos = {x_pos: 165, y_pos: 150}

xspacing = 90
yspacing = 0

for (var i = 0; i < hand_length[0]; i ++)
{
	var card_x = player_hand_pos.x_pos +  i * xspacing
	var card_y = player_hand_pos.y_pos + i * yspacing
	
	var card_info = {cost: irandom_range(1, 4), life: 5, attack: irandom_range(1, 3)}
	
	ds_queue_enqueue(global.action_queue, Action_draw_card(global.player_hand,
		{info: card_info,
		owner: obj_player,
		card_pos: {x_pos: card_x, y_pos: card_y},
		image_angle: 30,
		target_x: card_x,
		target_y: card_y,
		target_rot: 0}))
}

for (var i = 0; i < hand_length[0]; i ++)
{
	var card_x = opponent_hand_pos.x_pos +  i * xspacing
	var card_y = opponent_hand_pos.y_pos + i * yspacing
	
	var card_info = {cost: irandom_range(1, 4), life: 5, attack: irandom_range(1, 3)}
		
	ds_queue_enqueue(global.action_queue, Action_draw_card(global.opponent_hand,
		{info: card_info,
		owner: obj_opponent,
		card_pos: {x_pos: card_x, y_pos: card_y},
		image_angle: -30,
		target_x: card_x,
		target_y: card_y,
		target_rot: 0}))
}

#endregion

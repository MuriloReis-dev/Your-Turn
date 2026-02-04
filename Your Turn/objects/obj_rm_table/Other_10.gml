/// @description Compra cartas e inicia round
// Cartas

var hand_length = [5, 1] // Máximo de cartas na mão

var player_hand_pos = {x_pos: 1395, y_pos: 930}
var opponent_hand_pos = {x_pos: 165, y_pos: 150}

xspacing = 90
yspacing = 0

var fila = ds_queue_create()

for (var i = 0; i < hand_length[0]; i ++)
{
	var card_x = player_hand_pos.x_pos +  i * xspacing
	var card_y = player_hand_pos.y_pos + i * yspacing
	
	var card_info = {cost: irandom_range(1, 4), life: 5, attack: irandom_range(1, 3)}
	
	ds_queue_enqueue(fila, new Action_draw_card(global.player_hand,
		{info: card_info,
		owner: OWNERS.PLAYER,
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
		
	ds_queue_enqueue(fila, new Action_draw_card(global.opponent_hand,
		{info: card_info,
		owner: OWNERS.OPPONENT,
		card_pos: {x_pos: card_x, y_pos: card_y},
		image_angle: -30,
		target_x: card_x,
		target_y: card_y,
		target_rot: 0}))
}

// desbloqueia controles ao comprar todas as cartas
ds_queue_enqueue(fila, create_action(function(){ global.game_state = GAME_STATE.PLAYING }))

// inicia fila de ações
array_push(global.action_groups, new Action_group(fila))

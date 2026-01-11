global.deck = {x_pos: 2010, y_pos: 540}

hand_length = 5 // Máximo de cartas na mão

global.player_hand = []
global.opponent_hand = []

global.instances = [] // array que guarda instâncias na sala para configuração de depth

global.game_round = 1
global.resolving = false

var player_hand_pos = {x_pos: 1395, y_pos: 930}
var opponent_hand_pos = {x_pos: 165, y_pos: 150}

while (hand_length - array_length(global.player_hand) > 0)
{
	var card_x = player_hand_pos.x_pos +  array_length(global.player_hand) * 90
	var card_y = player_hand_pos.y_pos
	
	var card_info = {cost: irandom_range(1, 4), life: 5, attack: irandom_range(1, 3)}
	
	var card = instance_create_layer(global.deck.x_pos, global.deck.y_pos, "Instances", obj_card,
		{info: card_info,
		owner: obj_player,
		card_pos: {x_pos: card_x, y_pos: card_y},
		target_x: card_x,
		target_y: card_y})
	
	array_push(global.player_hand, card)
}

while (hand_length - array_length(global.opponent_hand) > 0)
{
	var card_x = opponent_hand_pos.x_pos +  array_length(global.opponent_hand) * 90
	var card_y = opponent_hand_pos.y_pos
	
	var card_info = {cost: irandom_range(1, 4), life: 5, attack: irandom_range(1, 3)}
	
	var card = instance_create_layer(global.deck.x_pos, global.deck.y_pos, "Instances", obj_card,
		{info: card_info,
		owner: obj_opponent,
		card_pos: {x_pos: card_x, y_pos: card_y},
		target_x: card_x,
		target_y: card_y})
	
	array_push(global.opponent_hand, card)
}

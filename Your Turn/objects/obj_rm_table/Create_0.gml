global.game_state = GAME_STATE.CUTSCENE

#region Globais

global.draggable_instances = [] // array que guarda instâncias arrastáveis

global.board = []

global.deck = {x_pos: 2010, y_pos: 540}

global.player_hand = []
global.opponent_hand = []


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

event_user(0)

#endregion

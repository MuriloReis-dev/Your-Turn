// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Action_draw_card(_hand, _var_struct)
{
	return {
		card: undefined,
		hand: _hand,
		var_struct: _var_struct,
		
		start: function()
		{
			var card = instance_create_layer(
				global.deck.x_pos,
				global.deck.y_pos,
				"Instances",
				obj_card,
				self.var_struct)
			
			card.in_action = true
			
			array_push(self.hand, card)
			
			self.card = card
		},

		update: function()
		{
			var card = self.card
			
			card.depth = -100
			
			if (card_animation(card, card.target_x, card.target_y, card.target_rot, 50))
				card.in_action = false
			
		    return card.in_action
		},

		finish: function()
		{
		    show_debug_message(self.var_struct)
		}
	}
}
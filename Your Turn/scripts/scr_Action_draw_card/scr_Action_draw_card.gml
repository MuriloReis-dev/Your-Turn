/// @description Ação de comprar carta
/// @param _hand Array global que irá guardar a carta comprada
/// @param _var_struct Estrutura de variáveis da instância de carta
function Action_draw_card(_hand, _var_struct) constructor
{
	// Herança
	var base = new Action_Base()
	start = base.start
	update = base.update
	finish = base.finish
	
	
	card = undefined
	hand = _hand
	var_struct = _var_struct
		
	start = function()
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
	}

	update = function()
	{
		var card = self.card
			
		card.depth = -100
			
		if (card_animation(card, card.target_x, card.target_y, card.target_rot, 50))
			card.in_action = false
			
		return card.in_action
	}
}
function Action_attack(_card, _target, _angle)
{
	return {
		card: _card,
		target: _target,
		angle: _angle,

		start: function()
		{
			var this = self.card
			
			self.initial_pos = {x_pos: this.x, y_pos: this.y, rot: this.image_angle}
			self.step = 0
			
			this.in_action = true
			
			this.target_x = self.target.x
			this.target_y = self.target.y
			
			this.target_rot = self.angle
		},

		update: function()
		{
			var this = self.card
			
			this.depth = -100
			
			if (card_animation(this, this.target_x, this.target_y, this.target_rot, 20))
			{
				if (self.step == 0)
				{
					self.target.life -= self.card.attack // tira a vida da carta
					trigger_particle(spr_blood, self.target.x, self.target.y, irandom_range(10, 20))
					
					this.target_x = self.initial_pos.x_pos
					this.target_y = self.initial_pos.y_pos
					this.target_rot = self.initial_pos.rot
					
					self.step = 1
				}
				else if (self.step == 1)
					this.in_action = false
			}
			
			
		    return this.in_action;
		},

		finish: function()
		{
			show_debug_message("")
		}
	}
}

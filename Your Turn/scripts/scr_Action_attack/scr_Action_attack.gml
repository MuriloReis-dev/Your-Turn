/// @description Ação de ataque para uma carta
/// @param _card Carta que executa o ataque
/// @param _target Carta que recebe o ataque
/// @param _angle Ângulo de inclinação da carta
function Action_attack(_card, _target, _angle) constructor
{
	// Herança
	var base = new Action_Base();
	start  = base.start
	update = base.update
	finish = base.finish
	
	
	card = _card
	target = _target
	angle = _angle

	step = 0

	// Overrides
	start = function()
	{
		var this = card;

		initial_pos = { 
			x_pos: this.x, 
			y_pos: this.y, 
			rot: this.image_angle 
		};

		this.in_action = true;

		this.target_x = target.x;
		this.target_y = target.y;
		this.target_rot = angle;
	}

	update = function()
	{
		var this = card;
		this.depth = -100;

		if (card_animation(this, this.target_x, this.target_y, this.target_rot, 15 - step * 5))
		{
			if (step == 0)
			{
				target.life -= card.attack;
				trigger_particle(spr_blood, target.x, target.y, irandom_range(20, 30));

				this.target_x = initial_pos.x_pos;
				this.target_y = initial_pos.y_pos;
				this.target_rot = initial_pos.rot;

				step = 1;
			}
			else
			{
				this.in_action = false;
			}
		}

		return this.in_action;
	}
}

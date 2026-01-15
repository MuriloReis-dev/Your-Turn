#region Variáveis
var energy_spot_x = x + 3 * image_xscale
var energy_spot_y = y - 102 * image_yscale

var life_spot_x = x - 3 * image_xscale
var life_spot_y = y + 12 * image_yscale

var attack_spot_x = x + 3 * image_xscale
var attack_spot_y = y + 102 * image_yscale

var text_color = #FFFFFF
var sprite = sprite_index
var frame = image_index

if (owner == obj_player)
{
	text_color = #197B30
	sprite = spr_card_player
	frame = 1
}
else if (owner == obj_opponent)
{
	text_color = #9E0B0F
	sprite = spr_card_opponent
	frame = 1
	
	if (!played)
		frame = 0
}

#endregion

sprite_index = sprite
image_index = frame

draw_self()

if (on_slot)
	draw_sprite_ext(
		spr_card_shadow,
		0,
		x,
		y,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha)

#region Texto
if (frame != 0)
{
	draw_sprite_ext(
		spr_numbers,
		max(0, cost),
		energy_spot_x,
		energy_spot_y,
		image_xscale,
		image_yscale,
		image_angle,
		text_color,
		image_alpha)

	draw_sprite_ext(
		spr_numbers,
		max(0, life),
		life_spot_x,
		life_spot_y,
		image_xscale,
		image_yscale,
		image_angle,
		text_color,
		image_alpha)

	draw_sprite_ext(
		spr_numbers,
		max(0, attack),
		attack_spot_x,
		attack_spot_y,
		image_xscale,
		image_yscale,
		image_angle,
		text_color,
		image_alpha)
}
#endregion

//draw_text(x, y - 200, id)
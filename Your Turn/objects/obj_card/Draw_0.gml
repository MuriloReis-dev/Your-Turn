#region Variáveis

// Posição dos números
var energy_offset = [3 * image_xscale, -102 * image_yscale];
var life_offset = [-3 * image_xscale, 12 * image_yscale];
var attack_offset = [3 * image_xscale, 102 * image_yscale];

// calcula a posição baseado na rotação da carta
var energy_dist = point_distance(0, 0, energy_offset[0], energy_offset[1])
var energy_ang = point_direction(0, 0, energy_offset[0], energy_offset[1]) + image_angle

var life_dist = point_distance(0, 0, life_offset[0], life_offset[1])
var life_ang = point_direction(0, 0, life_offset[0], life_offset[1]) + image_angle

var attack_dist = point_distance(0, 0, attack_offset[0], attack_offset[1])
var attack_ang = point_direction(0, 0, attack_offset[0], attack_offset[1]) + image_angle


var energy_spot = [x + lengthdir_x(energy_dist, energy_ang), y + lengthdir_y(energy_dist, energy_ang)]
var life_spot = [x + lengthdir_x(life_dist, life_ang), y + lengthdir_y(life_dist, life_ang)]
var attack_spot = [x + lengthdir_x(attack_dist, attack_ang), y + lengthdir_y(attack_dist, attack_ang)]


// Outros
var text_color = #FFFFFF
var sprite = sprite_index
var frame = image_index


if (owner == obj_player)
{
	text_color = #197B30
	sprite = spr_card_player
	frame = (on_slot && !played) ? 0 : 1
}
else if (owner == obj_opponent)
{
	text_color = #9E0B0F
	sprite = spr_card_opponent
	frame = (on_slot && played) ? 1 : 0
}

#endregion

sprite_index = sprite
image_index = frame

draw_self()

if (false)
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
		energy_spot[0],
		energy_spot[1],
		image_xscale,
		image_yscale,
		image_angle,
		text_color,
		image_alpha)

	draw_sprite_ext(
		spr_numbers,
		max(0, life),
		life_spot[0],
		life_spot[1],
		image_xscale,
		image_yscale,
		image_angle,
		text_color,
		image_alpha)

	draw_sprite_ext(
		spr_numbers,
		max(0, attack),
		attack_spot[0],
		attack_spot[1],
		image_xscale,
		image_yscale,
		image_angle,
		text_color,
		image_alpha)
}
#endregion

//draw_text(x, y - 200, selected)
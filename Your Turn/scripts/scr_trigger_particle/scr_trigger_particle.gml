/// @description Cria partículas dentro da room
/// @param spr Sprite da partícula
/// @param _x Posição x da partícula
/// @param _y Posição y da partícula
/// @param ammont Quantidade de partículas a se criar
function trigger_particle(spr, _x, _y, ammont)
{
	for (var i = 0; i < ammont; i++)
	{
		instance_create_layer(_x, _y, "Instances", obj_particle, {sprite: spr})
	}
}
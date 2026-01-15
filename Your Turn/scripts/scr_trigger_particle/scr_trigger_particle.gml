// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function trigger_particle(spr, _x, _y, ammont)
{
	for (var i = 0; i < ammont; i++)
	{
		instance_create_layer(_x, _y, "Instances", obj_particle, {sprite: spr})
	}
}
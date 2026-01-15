/// @description Executa animação de movimento, retorna se a instância já está no target
/// @param target_x Coordenada x do ponto final de animação
/// @param target_y Coordenada y do ponto final de animação
/// @param target_rot Ângulo final de animação
/// @param spd Velocidade da animação
function card_animation(inst, target_x, target_y, target_rot, spd)
{
	// define angle_start se não existe
	if (!variable_instance_exists(inst, "angle_start"))
		inst.angle_start = inst.image_angle
	
	if (inst.x == target_x && inst.y == target_y && inst.image_angle == target_rot)
		return true // retorna se já está na posição
	
	// direção
	var hdir = target_x > inst.x ? 1 : -1
	var vdir = target_y > inst.y ? 1 : -1
	var rotdir = target_rot > inst.image_angle ? 1 : -1
	
	// distância
	var xdist = target_x - inst.xstart
	var ydist = target_y - inst.ystart
	var dist = point_distance(inst.xstart, inst.ystart, target_x, target_y);
	
	var ang_dist = target_rot - inst.angle_start;
	
	var hspd = dist != 0 ? (xdist / dist) * spd : 0;
    var vspd = dist != 0 ? (ydist / dist) * spd : 0;
	var rot_spd = dist != 0 ? (ang_dist * spd) / dist : 0;
	
	// verifica se o próximo frame passa do target
	if ((inst.x + hspd) * hdir >= (target_x) * hdir) // verifica eixo x
	{
		inst.x = target_x
		
		hspd = 0
		
		inst.xstart = inst.x
	}
	if ((inst.y + vspd) * vdir >= (target_y) * vdir) // verifica eixo y
	{
		inst.y = target_y
		
		vspd = 0
		
		inst.ystart = inst.y
	}
	if ((inst.image_angle + rot_spd) * rotdir >= (target_rot) * rotdir)
	{
	    inst.image_angle = target_rot;
		
		rot_spd = 0
		
		inst.angle_start = inst.image_angle
	}
	
	// movimento para a animação
	inst.x += hspd
	inst.y += vspd
	inst.image_angle += rot_spd
	
	return false
}
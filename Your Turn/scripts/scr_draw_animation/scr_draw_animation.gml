/// @description Executa animação de movimento
/// @param target_x Coordenada x do ponto final de animação
/// @param target_y Coordenada y do ponto final de animação
function draw_animation(target_x, target_y, spd){
	if (x == target_x && y == target_y)
		return // retorna se já está na posição
	
	// direção
	var hdir = target_x > x ? 1 : -1
	var vdir = target_y > y ? 1 : -1
	
	// distância
	var xdist = target_x - initial_x
	var ydist = target_y - initial_y
	var dist = point_distance(initial_x, initial_y, target_x, target_y);
	
	var hspd = dist != 0 ? (xdist / dist) * spd : 0;
    var vspd = dist != 0 ? (ydist / dist) * spd : 0;
	
	// verifica se o próximo frame passa do target
	if ((x + hspd) * hdir >= (target_x) * hdir) // verifica eixo x
	{
		x = target_x
		
		hspd = 0
		
		initial_x = target_x
	}
	if ((y + vspd) * vdir >= (target_y) * vdir) // verifica eixo y
	{
		y = target_y
		
		vspd = 0
		
		initial_y = target_y
	}
	
	// movimento para a animação
	x += hspd
	y += vspd
}
/* VARIÀVEIS DE INSTÂNCIA
	== Int ==
	card_id: identificador da carta com base na ordem de criação
	
	== Real ==
	spd: velocidade de movimento durante animação
	hspd: velocidade horizontal
	vspd: velocidade vertical
	
	== Outros ==
	info: struct com informações da carta
*/
inst_id = save_instance(global.instances)

info = info ?? {cost: 0, life: 0, attack: 0}

// Valores
cost = info.cost
life = info.life
attack = info.attack

card_pos = card_pos ?? {x_pos: x, y_pos: x}

// ANIMAÇÂO
target_x = target_x ?? x
target_y = target_y ?? y

dragging = false
/// @description Navega para outra sala
if (global.game_state == GAME_STATE.CUTSCENE) exit

var trg_room = event_args.trg_room ?? undefined
if (trg_room == undefined || trg_room == room) exit

var transition = instance_find(obj_room_transition, 0)
if (transition != noone)
{
	transition.sprite = spr_blink
	transition.target_room = trg_room
	transition.active = true
}

event_args = {} // reseta argumentos de evento
#region Setando contexto baseado no estado do jogo
if (global.game_state == GAME_STATE.WAITING)
{
	context.drag = false
	context.navigate = true
	context.interact = false
}
if (global.game_state == GAME_STATE.PLAYING)
{
	context.drag = true
	context.navigate = true
	context.interact = true
}
if (global.game_state == GAME_STATE.CUTSCENE)
{
	context.drag = false
	context.navigate = false
	context.interact = false
}
if (global.game_state == GAME_STATE.MENU)
{
	context.drag = false
	context.navigate = false
	context.interact = true
}
#endregion
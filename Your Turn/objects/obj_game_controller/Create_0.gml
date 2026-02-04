randomise()

// Estados do jogo
enum GAME_STATE
{
	WAITING,
	PLAYING,
	CUTSCENE,
	MENU
}
global.game_state = GAME_STATE.MENU // estado atual do jogo

// Especifíca uma relação de propriedade para instâncias
enum OWNERS
{
	PLAYER,
	OPPONENT
}

// Valores usados durante o jogo
enum STATS
{
	ENERGY,
	MOVES,
	BEANS
}

global.player_stats = {energy: 6, moves: 2, beans: 5}
global.opponent_stats = {energy: 3, moves: 2, beans: 8}

event_args = {} // variável temporária para definir argumentos ao executar um evento
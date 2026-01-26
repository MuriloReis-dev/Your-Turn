randomise()

enum GAME_STATE
{
	WAITING,
	PLAYING,
	CUTSCENE,
	MENU
}

global.game_state = GAME_STATE.MENU


context = {
	drag: false, // arrastar objetos da cena
	navigate: false, // navegar entre salas
	interact: false // interagir com botões e menus
}

event_args = {} // variável temporária para definir argumentos ao executar um evento
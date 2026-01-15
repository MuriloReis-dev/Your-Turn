/// @description Cria uma ação para ser usada em Data Structures de ações
/// @param _start Função executada ao iniciar ação
/// @param _update Função executada durante a ação (retorna true se ação terminou e false se ação continua)
/// @param _finish Função executada ao finalizar ação
/// @param var_struct Estrutura de variáveis usadas nas funções da ação
function create_action(_start = function() {} , _update = function() { return true }, _finish = function() {}, var_struct = {})
{
	var action = {}
	
	// copia todas as variáveis da struct para a action
	var keys = variable_struct_get_names(var_struct);
	var len = array_length(keys);

	for (var i = 0; i < len; i++)
	{
		var k = keys[i];
		action[$ k] = var_struct[$ k];
	}
	
	action.start = _start
	action.update = _update
	action.finish = _finish
	
	return action
}

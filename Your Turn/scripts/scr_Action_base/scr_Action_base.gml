/// @description Estrutura base para ações
function Action_Base() constructor
{
	start  = function() {};
	update = function() { return true };
	finish = function() {};
}

/// @description Salva a instância atual em uma array e retorna seu index
/// @param array A array na qual a instância será guardada
function save_instance(array)
{
	array_push(array, id)
	var inst_id = array_find_index(array, function (value, index)
	{
		if (value == id)
			return true
		return false
	})
	
	return inst_id
}
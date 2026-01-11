///@description Pega a instância com a menor depth sob o ponteiro do mouse
///@param type Tipo da instância a ser encontrada
function get_inst_on_top(type)
{
	var inst = noone
	var inst_depth = infinity
	
	with (type)
	{
		if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
		{
			if (depth < inst_depth)
			{
				inst = id
				inst_depth = depth
			}
		}
	}
	
	return inst
}
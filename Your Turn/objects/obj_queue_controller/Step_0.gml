for (var i = 0; i < array_length(global.action_groups); i++)
{
	var action_group = global.action_groups[i]
	if (!action_group.is_executing && !ds_queue_empty(action_group.group))
	{
		action_group.current_action = ds_queue_dequeue(action_group.group);
		action_group.current_action.start();
		action_group.is_executing = true;
	}

	if (action_group.is_executing)
	{
	    if (!action_group.current_action.update()) // se update retornar false, finaliza ação
		{
	        action_group.current_action.finish();
	        action_group.is_executing = false;
	        action_group.current_action = undefined;
	    }
	}
}
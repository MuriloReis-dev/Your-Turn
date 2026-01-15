if (!is_executing && !ds_queue_empty(global.action_queue))
{
	current_action = ds_queue_dequeue(global.action_queue);
	current_action.start();
	is_executing = true;
}

if (is_executing)
{
    if (!current_action.update()) // se update retornar false, finaliza ação
	{
        current_action.finish();
        is_executing = false;
        current_action = undefined;
    }
}

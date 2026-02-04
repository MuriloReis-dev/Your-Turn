if (is_undefined(owner) || is_undefined(type)) exit;

if (owner == OWNERS.PLAYER)
{
	if (!is_undefined(global.player_stats))
	{
		switch (type)
		{
			case STATS.ENERGY:
				image_index = global.player_stats.energy ?? 0
				break;
			case STATS.MOVES:
				image_index = global.player_stats.moves ?? 0
				break;
			case STATS.BEANS:
				image_index = global.player_stats.beans ?? 0
				break;
		}
	}
}
if (owner == OWNERS.OPPONENT)
{
	if (!is_undefined(global.opponent_stats))
	{
		switch (type)
		{
			case STATS.ENERGY:
				image_index = global.opponent_stats.energy ?? 0
				break;
			case STATS.MOVES:
				image_index = global.opponent_stats.moves ?? 0
				break;
			case STATS.BEANS:
				image_index = global.opponent_stats.beans ?? 0
				break;
		}
	}
}
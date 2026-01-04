timer += delta_time


if (timer >= timer_value + 3_000_000 && !audio_played)
{
	audio_play_sound(sound, 0, false)
	audio_played = true
}


if (image_index >= last_frame)
{
	image_index = last_frame
	image_speed = 0
	if (timer >= timer_value + 3_000_000)
		event_perform(ev_create, 0)
}
else if (timer >= timer_value)
	image_speed = 1


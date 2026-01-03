global.timer += delta_time


if (image_index >= last_frame)
	image_speed = 0
else if (global.timer >= timer_value)
	image_speed = 1


if (global.timer >= timer_value + 3_000_000)
{
	global.timer = 0
	audio_play_sound(sound, 0, false)
	instance_create_layer(x, y, "Instances", obj_lightning)
	instance_destroy()
}

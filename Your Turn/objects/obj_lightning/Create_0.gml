timer_value = random_range(10_000_000, 30_000_000) // entre 10 e 100 segundos
timer = 0

audio_played = false

lightning_force = irandom_range(1, 3)
var colors = ([(#F1CCFF), (#FFFFFF), (#FFFFB2)])
color = colors[irandom(2)]

last_frame = 0
sound = noone

switch (lightning_force)
{
	case 1: last_frame = 2; sound = snd_thunder_1; break;
	case 2: last_frame = 5; sound = snd_thunder_2; break;
	case 3: last_frame = 9; sound = snd_thunder_3; break;
}

image_index = 0
image_speed = 0

depth = -1000

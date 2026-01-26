if (sprite == noone) exit

transition_frame = (image_number - 1) / 2

image_speed = active ? 1 : 0

if (image_index >= transition_frame && room != target_room)
	room_goto(target_room)

if (image_index >= image_number - 1)
{
	image_index = 0
	active = false
}

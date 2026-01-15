if (reverse)
	image_speed = -1

if (reverse && image_index <= 0)
	instance_destroy()

if (!reverse && image_index >= image_number - 1)
{
	global.lock_controls = false
	room_goto(target_room)
	reverse = true
}

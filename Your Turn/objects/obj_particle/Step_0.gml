x += hspd
y += min(vspd, 15)
image_angle += rot_spd
image_alpha -= disapear_spd

vspd += weigth


if (image_alpha <= 0)
	instance_destroy()

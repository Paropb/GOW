for(i = 0; i < length_laser; i++)
{
	xEnd = x + lengthdir_x(i, direction);
	yEnd = y + lengthdir_y(i, direction);
	draw_sprite_ext(spr_new_laser, 1, x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), 1, 1, direction, c_white, 1 );
}



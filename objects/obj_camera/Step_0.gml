if(instance_exists(target))
{
	var _dis_x = mouse_x -  target.x;
	var _dis_y = mouse_y - target.y;
	
	cameraX = target.x + _dis_x/3 - cameraWidth / 2;
	cameraY = target.y + _dis_y/3 - cameraHeight / 2;
	
	cameraX = clamp(cameraX, 0, room_width - cameraWidth);
	cameraY = clamp(cameraY, 0, room_height - cameraHeight);
}

if shake_duration >= 0 and shake_duration-- > 0
{
	var _randX = random_range(-shakeIt_amount, shakeIt_amount);
	var _randY = random_range(-shakeIt_amount, shakeIt_amount);
	cameraX += _randX;
	cameraY += _randY;
}

camera_set_view_pos(view_camera[0], cameraX, cameraY);


if(instance_exists(obj_bow))
{
	x = obj_bow.x;
y = obj_bow.y;

direction = point_direction(x, y, mouse_x, mouse_y);

var max_length = 900;
for(i = 0; i < max_length; i++)
{
	xEnd = x + lengthdir_x(i, direction);
	yEnd = y + lengthdir_y(i, direction);
	
	length_laser = i;
		
	if(collision_point(xEnd, yEnd, obj_solid, 0, 0))
	{
		break;
	}
}

if(instance_exists(obj_enemy_parent))
{
	var _list = ds_list_create();
	var _hits = collision_line_list(x, y, xEnd, yEnd, obj_enemy_parent, 0, 0, _list, 0);
	if(_hits > 0)
	{
		inst_7C655830.shake_duration = 1;
		inst_7C655830.shakeIt_amount = 1;
		for(var k = 0; k < _hits; ++k)
		{
			audio_play_sound(sound_break_glass, 0, false, 1, 0, random_range(0.8, 1.1));
			damage_entity(_list[| k], id, 0.33, 0);
		}
	}
}

}



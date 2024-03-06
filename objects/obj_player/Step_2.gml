var _depth = (aim_dir > 0 and aim_dir < 180);
var _should_use_upside_down = (aim_dir > 90 and aim_dir < 270);

depth = -bbox_bottom;

if instance_exists(my_bow)
{
	my_bow.depth = depth - 1;

	my_bow.x = x + lengthdir_x(bow_dis, aim_dir);
	my_bow.y = y + lengthdir_y(bow_dis, aim_dir);

	bow_dis = lerp(bow_dis, 11, 0.1);
	
	if(_should_use_upside_down)
	{
		my_bow.sprite_index = s_gun_upsidedown;
	}
	else
	{
		my_bow.sprite_index = s_gun;	
	}
}




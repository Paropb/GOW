function reset_variables()
{
	left = 0
	right = 0
	up = 0
	down = 0
	hmove = 0
	vmove = 0
}
function get_input()
{
	if (keyboard_check(ord("A"))/*||keyboard_check(vk_left)*/) left = 1
	if (keyboard_check(ord("D"))/*||keyboard_check(vk_right)*/) right = 1
	if (keyboard_check(ord("W"))/*||keyboard_check(vk_up)*/) up = 1
	if (keyboard_check(ord("S"))/*||keyboard_check(vk_down)*/) down = 1
	return {_left: left, _right: right, _up: up, _down: down};
}
function calc_movement()
{
	hmove = right - left
	vmove = down - up
	
	var _facing = (aim_dir < 90 or aim_dir > 270);
	if(_facing == 0)
	{
		_facing = -1;
	}
	facing = _facing;
	
	if hmove != 0 or vmove != 0{
		var _dir = point_direction(0, 0, hmove, vmove)
		hmove = lengthdir_x(move_speed, _dir)
		vmove = lengthdir_y(move_speed, _dir)
		
		x += hmove
		y += vmove
	}
	
	x += hsp;
	y += vsp;
	
	switch(state)
	{
		default: var _drag = 0.15; break;
		case states.DEAD: var _drag = 0.08; break;
	}
	
	hsp = lerp(hsp, 0, _drag);
	vsp = lerp(vsp, 0, _drag);
}

function aim_bow()
{	
	aim_dir = point_direction(x, y, mouse_x, mouse_y);
	my_bow.image_angle = aim_dir;
}

function anim()
{
	
	
	switch(state)
	{
		default:
			if(hmove != 0 or vmove != 0)
			{
				sprite_index = s_player_walk;
			}
			else
			{
				sprite_index = s_player_idle;
			}
			break;
		case states.DEAD:
			sprite_index = s_player_dead;
			break;
		
	}
	

}
function check_fire()
{
	if(keyboard_check(vk_shift))
	{
		if(mouse_check_button(mb_left))
		{
			if(!instance_exists(obj_new_laser))
			{
				audio_play_sound(sound_laser, 0, true, 1, 0, random_range(0.9, 1.1));
				instance_create_layer(mouse_x, mouse_y, "Instances", obj_new_laser);
			}
		}
		else
		{
			audio_stop_sound(sound_laser);
			instance_destroy(obj_new_laser);
		}
	}
	else
	{
		if(instance_exists(obj_new_laser))
		{
			instance_destroy(obj_new_laser);
		}
		if(mouse_check_button(mb_left))
		{
			if can_attack == true
			{
				inst_7C655830.shake_duration = 8;
				inst_7C655830.shakeIt_amount = 4;
			
				audio_play_sound(sound_piano, 0, false, 1, 0, random_range(0.5, 1.5));
			
				can_attack = false;
				alarm[0] = fire_rate;
			
				var _dir = point_direction(x, y, mouse_x, mouse_y);
				bow_dis = 5;
			
				var _inst = instance_create_layer(x, y, "Arrows", obj_arrow);
				with(_inst)
				{
					speed = other.arrow_speed;
					direction = _dir;
					image_angle = _dir;
					owner_id = other;
				}
			}
		}
	}
}
function check_bomb()
{
	if mouse_check_button_pressed(mb_right)
	{
		if(can_throw_bomb)
		{
			can_throw_bomb = false;
			alarm[2] = bomb_cooldown;
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			var _inst = instance_create_layer(x, y, "Instances", obj_bomb);
			with(_inst)
			{
				hsp = lengthdir_x(other.bomb_power, _dir);
				vsp = lengthdir_y(other.bomb_power, _dir);
			}
		}
	}
		
}

function damage_entity(_tid, _sid, _damage, _knockback_time){
	///@desc	damage the target and return the dead status
	///@arg tid		real	target_id
	///@arg sid		real	source_id
	///@arg damage		real	how much damage to deal
	///@arg knockback_time		real	how long to knock back the target
	
	with(_tid)
	{
		if alarm[1] > 0 exit;
		
		if _tid == inst_1FDB68EB
		{
			inst_7C655830.shake_duration = 30;
			inst_7C655830.shakeIt_amount = 12;
		}		
		
		hp -= _damage;
		var _dead = is_dead();
		
		path_end();
		
		//set knock back dis
		if _dead var _dis = 5 else var _dis = 3;
		var _dir = point_direction(_sid.x, _sid.y, x, y);
		hsp += lengthdir_x(_dis, _dir);
		vsp += lengthdir_y(_dis, _dir);
		calc_path_delay = _knockback_time;
		alert = true;
		knockback_time = _knockback_time;
		alarm[1] = hurt_time; 
		if !_dead state = states.KNOCKBACK;
		return _dead;
	}
}
function is_dead()
{
	if state != states.DEAD
	{
		if hp <= 0
		{
			state = states.DEAD;
			hp = 0;
			image_index = 0;
			switch(object_index)
			{
				case obj_player:
					if instance_exists(my_bow) instance_destroy(my_bow);
				break;
				
				default:
				break;
			}
			return true;
		}
	}
	else
		return true;
}

function calc_entity_movement()
{
	x += hsp;
	y += vsp;
	
	//slow down
	
	
	switch(object_index)
			{
				case obj_player:
					
				break;
				default:
					hsp *= global.drag;
					vsp *= global.drag;
				break;
			}
	
	check_if_stopped();
}

function calc_knockback_movement()
{
	x += hsp;
	y += vsp;
	
	//slow down
	hsp *= global.drag;
	vsp *= global.drag;
	
	check_if_stopped();
	
	if knockback_time <= 0 state = states.IDLE;
}

function check_if_stopped()
{
	if abs(hsp) < 0.1 hsp = 0;
	if abs(vsp) < 0.1 vsp = 0;
}

function show_healthbar()
{
	if(hp > 0)
	{
		draw_healthbar(x - 7, y - 16, x + 7, y - 14, hp/hp_max * 100, $003300, $3232FF, $00B200, 0 ,1, 1);
	}
}

function collision()
{
	var _tx = x
	var _ty = y
	
	x = xprevious
	y = yprevious
	
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	if place_meeting(x + _disx * sign(_tx - x), y, obj_solid) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), obj_solid) y = round(y);
	
	repeat(_disx)
	{
		if(!place_meeting(x + sign(_tx - x), y, [obj_solid])) x += sign(_tx - x)
	}
	repeat(_disy)
	{
		if(!place_meeting(x, y + sign(_ty - y), [obj_solid])) y += sign(_ty - y)
	}
}
function collision_bounce()
{
	collision();
	if place_meeting(x + sign(hsp), y, obj_solid) hsp = -hsp;
	if place_meeting(x, y + sign(vsp), obj_solid) vsp = -vsp;
}
event_inherited();

if(x >= 545 and y <= 260) 
{
	if(door_closed == false)
	{
		door_closed = true;
		inst_54E7A9F0.x -= 15;
	}
}

switch(state)
{
	case states.KNOCKBACK:
		reset_variables();
		
		calc_movement();
		
		if(knockback_time-- <= 0)
		{
			state = states.IDLE;
		}
		
		anim();
		
	break;
	case states.DEAD:
		reset_variables();
		
		calc_movement();
		
		if ready_to_restart and keyboard_check_pressed(ord("R")) game_restart();
		
		anim();
		break;
	default:
		reset_variables();

		get_input();

		calc_movement();
		
		aim_bow();

		check_fire();

		anim();
		
	break;
	
}




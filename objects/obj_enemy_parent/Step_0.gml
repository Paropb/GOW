event_inherited();

switch(state)
{
	case states.IDLE:
	enter_attack = false;
		calc_entity_movement();
		check_for_player();
		if path_index != -1 state = states.MOVE;
		enemy_anim();
		break;
	case states.MOVE:
		calc_entity_movement();
		check_for_player();
		check_facing();
		if path_index == -1 state = states.IDLE;
		enemy_anim();
		break;
	case states.ATTACK:
		if(enter_attack == false)
		{
			enter_attack = true;
			audio_play_sound(sound_pop, 0, false, 1, 0, random_range(0.8, 1.1));
		}
		calc_entity_movement();
		perform_attack();
		check_facing();
		enemy_anim()
		break;
	case states.KNOCKBACK:
		calc_knockback_movement();
		enemy_anim()
		break;
	case states.DEAD:
		show_debug_message("enemy death")
		if dead == false 
		{
			audio_play_sound(sound_percussion, 0, false, 1, 0, random_range(0.8, 1.1));
			dead = true;
		}
		calc_entity_movement();
		enemy_anim();
		break;
}





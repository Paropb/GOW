switch(state)
{
	case states.DEAD:
		image_index = image_number - 1;
		image_speed = 0;
		ready_to_restart = true;
		
		if dead == false 
		{
			audio_play_sound(sound_player_death, 0, false, 1, 0, random_range(0.8, 1.1));
			dead = true;
		}
		break;
}


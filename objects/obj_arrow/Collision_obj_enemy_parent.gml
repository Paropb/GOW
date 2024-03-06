
if other.hp > 0
{
	audio_play_sound(sound_break_glass, 0, false, 1, 0, random_range(0.8, 1.1));
	damage_entity(other, owner_id, damage, knockback_time);
	arrow_die();
}



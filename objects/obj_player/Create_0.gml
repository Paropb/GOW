event_inherited();
move_speed = 2.5;

door_closed =  false;

//health
hp_max = 3;
hp = hp_max;

//bow
aim_dir = 0;
bow_dis = 11;
fire_rate = 30;
arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", obj_bow);

cursor_sprite = s_cursor;
window_set_cursor(cr_none);

ready_to_restart = false;


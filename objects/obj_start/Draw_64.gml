/// @description Insert description here
// You can write your code in this editor

text_space = 60;

text_x = display_get_gui_width() / 2;
text_y = display_get_gui_height() / 2;

draw_text_transformed(text_x - 150, text_y - text_space, "GOW", 6, 6, 0);
draw_text_transformed(text_x - 150, text_y + text_space, "Press Space To Start", 2, 2, 0);



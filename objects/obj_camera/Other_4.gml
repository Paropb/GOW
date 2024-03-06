cameraX = 0;
cameraY = 0;
target = obj_player;

cameraWidth = 360;
cameraHeight = 240;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);

displayScale = 4;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth, displayHeight);

surface_resize(application_surface, displayWidth, displayHeight);

//camera_set_view_angle(view_camera[0], 90);

alarm[0] = 1;

function resize(_scale)
{
	displayScale = _scale;
	displayWidth = cameraWidth * displayScale;
	displayHeight = cameraHeight * displayScale;

	window_set_size(displayWidth, displayHeight);

	surface_resize(application_surface, displayWidth, displayHeight);
	
	window_center();
}



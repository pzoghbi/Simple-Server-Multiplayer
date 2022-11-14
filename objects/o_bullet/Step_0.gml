/// @description 
if (x < -sprite_width) 
or (y < -sprite_width) 
or (x > room_width + sprite_width) 
or (y > room_height + sprite_width) {
	instance_destroy();
}
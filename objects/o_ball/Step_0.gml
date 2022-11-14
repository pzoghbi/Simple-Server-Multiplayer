/// @description 
mspeed = clamp(mspeed, 0, 100);
move_speed = mspeed / image_scale * time();
x_speed = lengthdir_x(move_speed, move_direction);
y_speed = lengthdir_y(move_speed, move_direction);

attempt_move(x_speed, y_speed);

x = round(x);
y = round(y);

if image_xscale <= 1/8{
	mspeed = lerp(mspeed, 0, 1/8);
}

image_xscale = lerp(image_xscale, image_scale, 1/8);
image_yscale = lerp(image_yscale, image_scale, 1/8);



/* dirt hole collision */
if !(slow) {
	if place_meeting(x, y, o_dirt_hole) {
		mspeed = mspeed / 2;
		slow = true;
	}
} else if !place_meeting(x, y, o_dirt_hole) {
	slow = false;
}

if (mspeed < 1) {
	image_alpha -= .05;
	if image_alpha <= 0 instance_destroy();
}
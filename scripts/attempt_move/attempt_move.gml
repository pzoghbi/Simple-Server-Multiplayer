var x_speed = argument0;
var y_speed = argument1;
if place_meeting(x + x_speed, y, o_solid) {
	while !place_meeting(x + sign(x_speed), y, o_solid){
		x += sign(x_speed);
	}
	image_xscale = image_scale * (1 - 1/4);
	
	x_speed = -x_speed;
	move_direction = point_direction(x, y, x + x_speed, y + y_speed);
}
x += x_speed;
if place_meeting(x, y + y_speed, o_solid) {
	while !place_meeting(x, y + sign(y_speed), o_solid){
		y += sign(y_speed);
	}
	image_yscale = image_scale * (1 - 1/4);
	
	y_speed = -y_speed;
	move_direction = point_direction(x, y, x + x_speed, y + y_speed);
}
y += y_speed;
/// @description 

var newBall = instance_create_layer(irandom(room_width), irandom(room_height), "Instances", o_ball);
newBall.image_scale = irandom(3) + 1;
alarm[0] = 60 * 60 * 2;
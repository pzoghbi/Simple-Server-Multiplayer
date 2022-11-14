/// @description 

var random_chance = irandom(100);
if (random_chance < 20) {
	instance_create_layer(x, y, "Instances", o_shovel);
}
global.BallCount--;


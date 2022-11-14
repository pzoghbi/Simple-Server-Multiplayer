/// @description 

if (image_xscale < 1/8) {
instance_destroy();
return 0;
}

instance_destroy(other);

repeat(2){
var new_ball = instance_create_layer(x, y, "Instances", o_ball);
	new_ball.image_scale = .5 * image_xscale;
	new_ball.image_xscale = image_xscale;
	new_ball.image_yscale = image_yscale;
}

instance_destroy();
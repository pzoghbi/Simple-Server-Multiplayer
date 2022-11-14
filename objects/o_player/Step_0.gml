/// @description 
switch(player_state) {
	case "dead":
		sprite_index = sprite_player_dead;
		if place_meeting(x, y, o_player) {
			player_health = player_health_max-1;
			player_state = "move";
		}
		return 0;
	break;
	case "move":
	sprite_index = sprite_player;
	var x_input = 0, y_input = 0, x_speed = 0, y_speed = 0;
	/* movement */
	if move_keys[KEY_LEFT] {
		x_input = -1;
	} else if move_keys[KEY_RIGHT] {
		x_input = 1;
	} else {
		x_input = 0;
	}

	if move_keys[KEY_UP] {
		y_input = -1;
	} else if move_keys[KEY_DOWN] {
		y_input = 1;
	} else {
		y_input = 0;
	}

	/* running */
	if (move_keys[KEY_RUN]) {
		move_speed = 200;
		image_speed = 200/128;
	} else {
		move_speed = 128;
		image_speed = 1;
	}
	/* set speed */
	is_moving = point_distance(0, 0, x_input, y_input) > 0;
	if is_moving {
		move_direction = point_direction(0, 0, x_input, y_input);
		if move_direction != last_direction {
			last_direction = move_direction;
		}
		x_speed = lengthdir_x(move_speed, last_direction) * time();
		y_speed = lengthdir_y(move_speed, last_direction) * time();
	
		image_speed = 1;
		if x_input != 0 {
			image_xscale = x_input;
		}
	} else {
		image_speed = 0;
	}

	/* collision */
	if place_meeting(x + x_speed, y, o_solid) {
		while !place_meeting(x + sign(x_speed), y, o_solid){
			x += sign(x_speed);
		}
		x_speed = 0;
	}

	if place_meeting(x, y + y_speed, o_solid) {
		while !place_meeting(x, y + sign(y_speed), o_solid){
			y += sign(y_speed);
		}
		y_speed = 0;
	}
	
	
	/* invincibility */
	if (invincibility--) {
		sprite_index = sprite_player_invincible;
	}
	
	if (player_health <= 0) {
		player_state = "dead";
		image_index = 0;
		image_speed = 1;
	} 
	
	break;
	default:
	break;
}


/* shooting */
if (shoot) {
	shoot = false;
	switch(weapon) {
	case player_weapons.needle:
		var needle = instance_create_layer(x + x_speed, y + y_speed, "Instances", o_bullet);
		needle.direction = last_direction;
		needle.speed = 2 * move_speed * time();
		needle.image_angle = needle.direction;
	break;
	case player_weapons.shovel:
		if !instance_position(x, y, o_dirt_hole) {
		var dirt_hole = instance_create_layer(x, y, "Instances", o_dirt_hole);
		}
		weapon = player_weapons.needle;
	break;
	default:
	break;
	}
}


// move~!
x += x_speed;
y += y_speed;
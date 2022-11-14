/// @description 

// move up
if keyboard_check(ord("W")) {
	send_key(ord("W"), 1);
} 
if keyboard_check_released(ord("W")){
	send_key(ord("W"), 0);
}

// move left
if keyboard_check(ord("A")) {
	send_key(ord("A"), 1);
} 
if keyboard_check_released(ord("A")){
	send_key(ord("A"), 0);
}

// move down
if keyboard_check(ord("S")) {
	send_key(ord("S"), 1);
} 
if keyboard_check_released(ord("S")){
	send_key(ord("S"), 0);	
}

// move right
if keyboard_check(ord("D")) {
	send_key(ord("D"), 1);
} 
if keyboard_check_released(ord("D")){
	send_key(ord("D"), 0);	
}

/* running */
if keyboard_check(vk_lshift) {
	send_key(vk_lshift, 1);
}
if keyboard_check_released(vk_lshift){
	send_key(vk_lshift, 0);	
}

/* shooting */
if keyboard_check_pressed(vk_space) {
	send_key(vk_space, 1);
	/*

	*/
}

/// @description 

var ID = async_load[? "id"];

if (server == ID){
	var IP = async_load[? "ip"];
	var TYPE = async_load[? "type"];
	var sock = async_load[? "socket"];
	
	switch(TYPE){
	case network_type_connect:
		// add specific client to the list
		ds_list_add(socketlist, sock);
		
		// create new player
		var inst = instance_create_layer(64, 128, "Instances", o_player);
		
		// associate socket ID with the instance
		ds_map_add(Clients, sock, inst);
		break;
	case network_type_disconnect:
		// de-associate the disconnecting client from that player
		var inst = ds_map_find_value(Clients, sock);
		//show_debug_message(inst.player_name + " disconnected.");
		
		ds_map_delete(Clients, sock);
		instance_destroy(inst);
		
		var index = ds_list_find_index(socketlist, sock);
		ds_list_delete(socketlist, index);
		break;
	}
} else if (ID == global.client){
	// Do nothing "local client"
} else {
	// Receive data from clients
	var buff = async_load[? "buffer"];
	
	var cmd = buffer_read(buff, buffer_s16);
	
	var sock = async_load[? "id"];
	var inst = ds_map_find_value(Clients, sock);
	
	switch(cmd){ 
	case CMD_KEY:
		var key = buffer_read(buff, buffer_s16);
		var pressed = buffer_read(buff, buffer_s16);
		
		switch(key){
			case ord("D"):
				key = KEY_RIGHT;
			break;
			case ord("W"):
				key = KEY_UP;
			break;
			case ord("A"):
				key = KEY_LEFT;
			break;
			case ord("S"):
				key = KEY_DOWN;
			break;
			case vk_space:
				inst.shoot = true;
			break;
			case vk_lshift:
				key = KEY_RUN;
			break;
		}
		
		if (pressed) {
			inst.move_keys[key] = true;
		} else {
			inst.move_keys[key] = false;
		}
	break;
	case CMD_HEALTH:
		inst.player_health -= buffer_read(buff, buffer_s16);
	break;
	case CMD_NAME:
		inst.player_name = buffer_read(buff, buffer_string);
	break;
	case CMD_DISCONNECT:
		ds_map_delete(Clients, sock);
		instance_destroy(inst);
		var index = ds_list_find_index(socketlist, sock);
		ds_list_delete(socketlist, index);
	break;
	default:
	break;
	}
}
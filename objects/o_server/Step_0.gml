/// @description 
var count = ds_list_size(socketlist);
if ( count>0 ) {
	/// send all sprites to all clients
	global.player_buffer = player_buffer;
	
	
	buffer_seek(player_buffer, buffer_seek_start, 0);
	
	// total number of sprites
	var sprite_count = global.PlayerCount+global.BallCount+global.BulletCount+global.ItemCount;
	buffer_write(player_buffer, buffer_u32, sprite_count);
	
	//show_debug_message(string(global.PlayerCount+global.BallCount+global.BulletCount));
	
	// dummy player x, y (clientx, clienty)
	buffer_write( global.player_buffer, buffer_s16, 0 );
	buffer_write( global.player_buffer, buffer_s16, 0 );
	buffer_write( global.player_buffer, buffer_u8, 0 );		// player HEALTH
	
	with (o_item) {
		buffer_write_sprite( global.player_buffer );
	}
	
	with (o_player) {
		buffer_write( global.player_buffer, buffer_f32, x );
		buffer_write( global.player_buffer, buffer_f32, y );
		buffer_write( global.player_buffer, buffer_u16, sprite_index );
		buffer_write( global.player_buffer, buffer_u8, image_index );
		buffer_write( global.player_buffer, buffer_f32, image_xscale );
		buffer_write( global.player_buffer, buffer_f32, image_yscale );
		buffer_write( global.player_buffer, buffer_s16, image_angle );
		buffer_write( global.player_buffer, buffer_s32, image_blend );
		buffer_write( global.player_buffer, buffer_string, player_name );
	}
	
	with (o_bullet) {
		buffer_write_sprite( global.player_buffer );
	}
	
	with (o_ball) {
		buffer_write_sprite( global.player_buffer );
	}
	
	var buffer_size = buffer_tell(player_buffer);
	
	// now send all data to all clients
	for (var i = 0; i < count; i++) {
		var sock = ds_list_find_value(socketlist, i);
		
		buffer_seek(player_buffer, buffer_seek_start, 4);
		
		var inst = ds_map_find_value(Clients, sock);
		buffer_write(global.player_buffer, buffer_s16, inst.x);
		buffer_write(global.player_buffer, buffer_s16, inst.y);
		buffer_write( global.player_buffer, buffer_u8, inst.player_health );
		
		// send this data to client
		network_send_packet(sock, player_buffer, buffer_size);
	}
}


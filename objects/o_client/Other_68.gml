/// @description 

var ID = async_load[? "id"];

if (client == ID) {
	// client is receiving game data
	
	// read all data
	var buffer = async_load[? "buffer"];
	
	// get number of sprites sent
	sprites = buffer_read(buffer, buffer_u32);
	//show_debug_message(sprites);
	
	// read out [THIS CLIENT]'s location
	clientx = buffer_read(buffer, buffer_s16);
	clienty = buffer_read(buffer, buffer_s16);
	clienthp = buffer_read(buffer, buffer_u8);
	
	// clear render list and replace with NEW data
	ds_list_clear(allsprites);
	for(var i = 0; i < sprites; i++) {
		ds_list_add(allsprites, buffer_read(buffer, buffer_f32));	// x
		ds_list_add(allsprites, buffer_read(buffer, buffer_f32));	// y
		ds_list_add(allsprites, buffer_read(buffer, buffer_u16));	// sprite_index
		ds_list_add(allsprites, buffer_read(buffer, buffer_u8));	// image_index
		ds_list_add(allsprites, buffer_read(buffer, buffer_f32));	// xscale
		ds_list_add(allsprites, buffer_read(buffer, buffer_f32));	// yscale
		ds_list_add(allsprites, buffer_read(buffer, buffer_s16));	// image_angle
		ds_list_add(allsprites, buffer_read(buffer, buffer_s32));	// image_blend
		ds_list_add(allsprites, buffer_read(buffer, buffer_string));// player name
	}
	
} else {
		
}
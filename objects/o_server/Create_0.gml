/// @description 

global.onHost = true;
global.client=0;
global.PlayerCount = 0;
global.BallCount = 0;
global.BulletCount = 0;

socketlist = ds_list_create();
Clients = ds_map_create();
player_buffer = buffer_create(16384, buffer_fixed, 1);

server = network_create_server(network_socket_tcp, 6510, 10);
if ( server<0 ) {
	global.onHost = false;
	ds_list_destroy(socketlist);
	ds_map_destroy(Clients);
	buffer_delete(player_buffer);
	instance_destroy();
}

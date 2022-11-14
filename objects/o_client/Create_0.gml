/// @description 


client = network_create_socket(network_socket_tcp);
global.client = client;

err = network_connect(client, global.connect_ip, 6510);
if ( err<0 ) {
	show_message("Failed to join.");
	game_restart();
}

sprites = 0;
allsprites = ds_list_create();

clientx = 64;
clienty = 128;
clienthp = 0;

buff = buffer_create(256, buffer_grow, 1);
clientname = get_string("Enter your name", "Player");
send_name(clientname);
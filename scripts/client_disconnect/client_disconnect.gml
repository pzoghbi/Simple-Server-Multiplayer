{
	buffer_seek(buff, buffer_grow, 0);
	
	buffer_write(buff, buffer_s16, CMD_DISCONNECT);
	
	network_send_packet(client, buff, buffer_tell(buff));
}
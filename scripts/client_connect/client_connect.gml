// client_connect(ip, port)

var 
ip = argument0,
port = argument1;

socket = network_create_socket(network_socket_tcp);
var connect = network_connect_raw(socket, ip, port);

send_buffer = buffer_create(256, buffer_fixed, 1);

clientmap = ds_map_create();

if (connect < 0)
{
	show_error("Error connecting to server!", true);
}
// server_handle_connect(socket_id)

var socket_id = argument0;

var l = instance_create_layer(0, 0, "Instances", obj_ServerClient);
l.socket_id = socket_id;
l.client_id = client_id_counter++;

if (client_id_counter > 65535) {
	client_id_counter = 0;
}

clientmap [? string(socket_id)] = l;
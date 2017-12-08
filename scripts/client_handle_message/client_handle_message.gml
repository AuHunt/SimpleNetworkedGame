// client_handle_message(buffer)

var
buffer = argument0;

while(true) 
{
	var message_id = buffer_read(buffer, buffer_u8);
	
	switch(message_id) 
	{
		case MESSAGE_MOVE:
			var
			client = buffer_read(buffer, buffer_u16),
			xx = buffer_read(buffer, buffer_u16),
			yy = buffer_read(buffer, buffer_u16);
			
			// If message has been received from this client in the past
			if (ds_map_exists(clientmap, string(client)))
			{
				var clientObject = clientmap[? string(client)];
				clientObject.x = xx;
				clientObject.y = yy;
			}
			else {
				var l = instance_create_layer(xx, yy, "Instances", obj_netPlayer);
				clientmap[? string(client)] = l;
			}
			
			with(obj_ServerClient) {
				if (client_id != other.client_id_current) {
					network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			}
			
		break;
	}
	
	if (buffer_tell(buffer) == buffer_get_size(buffer)) 
	{
		break;
	}
}
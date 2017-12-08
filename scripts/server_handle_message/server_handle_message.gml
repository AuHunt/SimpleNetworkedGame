// server_handle_message(socket_id, buffer)
#macro MESSAGE_MOVE 1
#macro MESSAGE_JOIN 2

var socket_id = argument0,
buffer = argument1,
clientObject = clientmap[? string(socket_id)],
client_id_current = clientObject.client_id;

while(true) 
{
	var message_id = buffer_read(buffer, buffer_u8);
	
	switch(message_id) 
	{
		case MESSAGE_MOVE:
			var 
			xx = buffer_read(buffer, buffer_u16),
			yy = buffer_read(buffer, buffer_u16);
			
			buffer_seek(send_buffer, buffer_seek_start, 0); // Sets buffer to start of message
			buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE); // Writes the type of message
			buffer_write(send_buffer, buffer_u16, client_id_current); // Writes client ID
			buffer_write(send_buffer, buffer_u16, xx); // Writes X coordinate
			buffer_write(send_buffer, buffer_u16, yy); // Writes Y coordinate
			
			with(obj_ServerClient) 
			{
				if (client_id != client_id_current) // If the client ID is not the same as the server client's ID
				{
					network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer)); // Sends data to all clients under server
				}
			}
		break;
		
		/*case MESSAGE_JOIN:
			username = buffer_read(buffer, buffer_string);
			clientObject.name = username;
			
			buffer_seek(send_buffer, buffer_seek_start, 0);
			buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
			buffer_write(send_buffer, buffer_u16, client_id_current);
			
			with(obj_ServerClient) {
				if (client_id != client_id_current) {
					network_send_raw(self.socket_id, other.send_buffer, buffer_tell(other.send_buffer));
				}
			}
			
			
		break;*/
	}
	
	if (buffer_tell(buffer) == buffer_get_size(buffer)) 
	{
		break;
	}
}
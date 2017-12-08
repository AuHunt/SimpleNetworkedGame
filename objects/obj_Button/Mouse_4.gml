if (text == "Create Server") {
	with(obj_Button) { instance_destroy(); }
	
	instance_create_layer(0,0, "Instances", obj_Server);
}
if (text == "Join Server") {
	with(obj_Button) { instance_destroy(); }
	
	audio_play_sound(UberHuman, 0, 1);
	instance_create_layer(0, 0, "Instances", obj_Client);
	instance_create_layer(400, 200, "Instances", obj_player);
}
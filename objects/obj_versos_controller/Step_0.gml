if (_versos_done < 3) {
	if (_verso_timer > 0) {
		_verso_timer -= 1;
	}

	if (_verso_timer == 0 and obj_versos._restart_timer_flag) {
		obj_versos._restart_timer_flag = false
		obj_versos.reset()
	}
} else if (_versos_done == 3) {
	obj_illojuan_streamer_versos_perversos.set_end_dialogue();
}

if(keyboard_check_pressed(vk_enter)) {
	var _layer_versos = layer_get_id("versos");
	instance_deactivate_layer(_layer_versos);
	audio_stop_all();
}

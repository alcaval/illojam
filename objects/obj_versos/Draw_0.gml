draw_set_font(fnt_arial_default); // Set the font
draw_set_color(c_black); // Set the color

if (_shake_begin) {
	obj_bokeron.sprite_index = spr_bokeron_bad
	_elapsed_time += 1;
	var _ran_y = irandom_range(-10,10)
	var _ran_x = irandom_range(-10,10)
	obj_bokeron.x = obj_bokeron.x + _ran_x
	obj_bokeron.y = obj_bokeron.y + _ran_y
    if (_elapsed_time >= _duration) {
        _elapsed_time = 0;
        _shake_begin = false;
		obj_bokeron.x = _original_x
		obj_bokeron.y = _original_y
		
		_verso_perverso = ""
		_verso_perverso_comparison = ""
		_split_verso_perverso = []
		_wrong_versos = []
		_word_counter = 0
		_result = ""
		_current_word_selected = 0
		_versos = array_shuffle(_versos);
		for (var _i = 0; _i < 6; _i++) {
			var _random_index = irandom(array_length(_versos)-1);
			_wrong_versos[_i] = _versos[_random_index]
		}
		var _obj_to_control = instance_find(obj_arrow_key, 0);
		_obj_to_control.visible = true
		obj_bokeron.sprite_index = spr_bokeron_portrait
    }
}

if ((_result != _verso_perverso_comparison or _word_counter == 0) and !_shake_begin) {
	for (var _i = 0; _i < array_length(_wrong_versos); _i++) {
		draw_text(x, y + (_i * 50), string_split(_wrong_versos[_i], ";")[_word_counter])
	}
	draw_text(obj_verso_result_pos.x, obj_verso_result_pos.y, _result)

	if (keyboard_check_pressed(vk_up)) {
		if (_current_word_selected > 0) {
			_current_word_selected -= 1
			audio_play_sound(snd_select_versos, 1000, false)
		}
	}
	if (keyboard_check_pressed(vk_down)) {
		if (_current_word_selected < 5) {
			_current_word_selected += 1
			audio_play_sound(snd_select_versos, 1000, false)
		}
	}
	obj_arrow_key.y = y + (_current_word_selected*50)

	if (keyboard_check_pressed(vk_space)) {
		var _current_word = string_split(_wrong_versos[_current_word_selected], ";")[_word_counter]
		if (_word_counter == 0) {
			_verso_perverso = _wrong_versos[_current_word_selected]
			for (var i = 0; i < array_length(_versos); i++) {
			    if (_versos[i] == _verso_perverso) {
			        array_delete(_versos, i, 1);
			        break; // Exit loop after deleting the entry
			    }
			}
			_verso_perverso_comparison = _wrong_versos[_current_word_selected]
			_verso_perverso_comparison = string_replace_all(_verso_perverso_comparison, ";", " ")
			_split_verso_perverso = string_split(_verso_perverso, ";")
			_result += _current_word
			audio_play_sound(snd_versos_perversos_yo, 1000, false)
		}
		if (_split_verso_perverso[_word_counter] == _current_word && _word_counter > 0) {
			_result += " " + _current_word
			audio_play_sound(snd_versos_perversos_yo, 1000, false)
			if (_result == _verso_perverso_comparison) {
				show_debug_message(_verso_perverso)
				show_debug_message(_versos)
				_restart_timer_flag = true
				obj_versos_controller._verso_timer = 40
				obj_versos_controller._versos_done += 1
			}
		} else if(_split_verso_perverso[_word_counter] != _current_word &&_word_counter > 0) {
			show_debug_message("MAL")
			_shake_begin = true
		}
		for (var _i = 0; _i < 5; _i++) {
			_versos = array_shuffle(_versos)
			_wrong_versos[_i] = _versos[0]
		}
		_wrong_versos[0] = _verso_perverso
		_wrong_versos = array_shuffle(_wrong_versos)
		_word_counter++
	}
} else if(_result == _verso_perverso_comparison) {
	obj_bokeron.sprite_index = spr_bokeron_correct
	var _obj_to_control = instance_find(obj_arrow_key, 0);
	_obj_to_control.visible = false
}
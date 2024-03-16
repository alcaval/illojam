if (_shake_begin == false and obj_versos_controller._verso_timer == 0) {
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
	} else if (_split_verso_perverso[_word_counter] != _current_word && _word_counter > 0) {
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
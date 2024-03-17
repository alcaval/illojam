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
	obj_arrow_key.y = y + (_current_word_selected*50)
} else if(_result == _verso_perverso_comparison) {
	obj_bokeron.sprite_index = spr_bokeron_correct
	var _obj_to_control = instance_find(obj_arrow_key, 0);
	_obj_to_control.visible = false
}
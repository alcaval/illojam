/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


with(obj_streamer_text) {
	draw_set_font(fnt_arial_default)
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text_ext(x, y, obj_illojuan_streamer_peluqueria_1.current_line ?? "", -1, 300)
}


draw_sprite_ext(old_sprite, 0, x, y, 1.25, 1.25, 0, c_white, 1)
draw_sprite_ext(new_sprite, 0, x, y, 1.25, 1.25, 0, c_white, alpha)

if(is_transitioning) {
	alpha += 0.05
	if(alpha >= 1) {
		is_transitioning = false
	}
}











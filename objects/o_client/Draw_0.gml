/// @description 
// set clients x and y
x = clientx;
y = clienty;

// draw health bar
for(var i = 0; i < 3; i++) {
	draw_sprite(sprite_heart, (i+1) > clienthp, x - 16 + i * 16, y - 24);
}

var index = 0;
for(var i = 0; i < sprites; i++) {
	var _x = allsprites[|index++];
	var _y = allsprites[|index++];
	var _sprite = allsprites[|index++];
	var _subimg = allsprites[|index++];
	var _xscale = allsprites[|index++];
	var _yscale = allsprites[|index++];
	var _rotate = allsprites[|index++];
	var _colour = allsprites[|index++];
	var _pname = allsprites[|index++];
	
	if (_sprite == (sprite_player) 
	or _sprite==(sprite_player_invincible) 
	or _sprite==(sprite_player_dead)) {
		// draw shadow
		draw_set_alpha(.5);
		draw_set_color(c_black);
		draw_ellipse(_x-16, _y+12, _x+16, _y+18, 0);
		draw_set_alpha(1);
	}
	draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rotate, _colour, 1.0);
	
	draw_set_font(font_name);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(_x, _y + 24, _pname);
}

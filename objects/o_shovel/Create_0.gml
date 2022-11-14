/// @description 
event_inherited();


var tex = sprite_get_texture(sprite_index, 0);
texel_w = texture_get_texel_width(tex);
texel_h = texture_get_texel_height(tex);

u_texel = shader_get_uniform(shader_outline, "in_texel");
u_color = shader_get_uniform(shader_outline, "in_color");
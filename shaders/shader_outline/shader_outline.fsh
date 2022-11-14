//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 in_texel;
uniform vec3 in_color;

void main()
{
	
	float tex_w = in_texel.x;
	float tex_h = in_texel.y;
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - tex_w ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + tex_w ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - tex_h ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + tex_h ).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
}

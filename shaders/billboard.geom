#version 330 core

layout (points) in;
layout (triangle_strip) out;
layout (max_vertices = 4) out;

uniform mat4 mvp;
uniform vec3 CamPosition;

out vec2 Texture;

void main(){
	vec3 Pos = gl_in[0].gl_Position.xyz;
	vec3 toCamera = normalize(CamPosition - Pos);
	vec3 up = vec3(0,1,0);
	vec3 right = cross(toCamera, up);
	Pos -= (right * 0.5);
	gl_Position = mvp * vec4(Pos, 1.0);
	Texture = vec2(0.0, 0.0);
	EmitVertex();
 
	Pos.y += 1.0;
	gl_Position = mvp * vec4(Pos, 1.0);
	Texture = vec2(0.0, 1.0);
	EmitVertex();
 
	Pos.y -= 1.0;
	Pos += right;
	gl_Position = mvp * vec4(Pos, 1.0);
	Texture = vec2(1.0, 0.0);
	EmitVertex();
 
	Pos.y += 1.0;
	gl_Position = mvp * vec4(Pos, 1.0);
	Texture = vec2(1.0, 1.0);
	EmitVertex();
	 
	EndPrimitive();
}

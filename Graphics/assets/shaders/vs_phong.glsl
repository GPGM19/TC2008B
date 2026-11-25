#version 300 es
in vec4 a_position;  // vs_phong.glsl
in vec3 a_normal;

uniform mat4 u_worldViewProjection;

// uniforms for lightinh
uniform mat4 u_world;
uniform mat4 u_worldInverseTransform;

uniform vec3 u_lightWorldPosition;
uniform vec3 u_viewWorldPosition;

// Varying to share data with the Fragment Shader
out vec3 v_normalVector;
out vec3 v_surfToLight;

void main() {

    // Transform the normal vector
    v_normalVector = (u_worldInverseTransform * vec4(a_normal, 0)).xyz;

    // Position after transforming the object
    vec3 transformedPos = (u_world * a_position).xyz;

    v_surfToLight = u_lightWorldPosition - transformedPos;

    gl_Position = u_worldViewProjection * a_position;
}
uniform ivec2 size;
uniform int mouseX;
uniform int mouseY;
uniform float times;

void main(){
  vec4 col = vec4(0,0,0,1);
  float l = 20.0;
  float l1 = 20.0+20.0*pow(cos(radians(times)),2.0);
  float l2 = 20.0+20.0*pow(cos(radians(times)+3.14/3.0),2.0);
  float l3 = 20.0+20.0*pow(cos(radians(times)+2.0*3.14/3.0),2.0);
  float c = l1/sqrt(pow(gl_FragCoord.x-float(size.x/2)-l/2.0,2.0)+pow(gl_FragCoord.y-float(size.y)+float(size.y/2)+l*sqrt(3.0)/3.0,2.0));
  vec3 rc = vec3(c,0,0);
  col += vec4(rc,1.0);
  c = l2/sqrt(pow(gl_FragCoord.x-float(size.x/2),2.0)+pow(gl_FragCoord.y-float(size.y)+float(size.y/2)-l*sqrt(3.0)/6.0,2.0));
  rc = vec3(0,c,0);
  col += vec4(rc,1.0);
  c = l3/sqrt(pow(gl_FragCoord.x-float(size.x/2)+l/2.0,2.0)+pow(gl_FragCoord.y-float(size.y)+float(size.y/2)+l*sqrt(3.0)/3.0,2.0));
  rc = vec3(0,0,c);
  col += vec4(rc,1.0);
  gl_FragColor = vec4(col);
}

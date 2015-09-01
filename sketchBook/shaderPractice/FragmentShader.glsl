uniform ivec2 size;
uniform int mouseX;
uniform int mouseY;
uniform float times;
uniform float r1;
uniform float r2;
uniform float r3;


const float NEON_WIDTH = 50.0;

//  HSBをRGBに変換する関数。
vec3 hsb2rgb(vec3 hsb)
{
  hsb.x = mod(hsb.x, 360.0);
  vec3 res = vec3(0, 0, 0);
  float h = mod(floor(hsb.x / 60.0), 6.0);
  float f = (hsb.x / 60.0) - h;
  float v = hsb.z;
  float p = v * (1.0 - hsb.y);
  float q = v * (1.0 - f * hsb.y);
  float t = v * (1.0 - (1.0 - f) * hsb.y);

  if(int(h) == 0){
    res = vec3(v, t, p);
  }else if(int(h) == 1){
    res = vec3(q, v, p);
  }else if(int(h) == 2){
    res = vec3(p, v, t);
  }else if(int(h) == 3){
    res = vec3(p, q, v);
  }else if(int(h) == 4){
    res = vec3(t, p, v);
  }else if(int(h) == 5){
    res = vec3(v, p, q);
  }
  return res;
}

vec4 drawLine(vec4 col, float off, float m, float offsetY){
  float tempTime = times * r3 * m;
  
  float h = cos(radians(gl_FragCoord.x * r1 + tempTime + off)) + sin(radians(gl_FragCoord.x * r2 + tempTime));
  h *= 25.0;
  h += offsetY;

  float t = abs(gl_FragCoord.y-h)/NEON_WIDTH;
  float c = 1.0 - t;

  if(c > 0.0){
    c = pow(c,3.0);
    vec3 rc = hsb2rgb(vec3(off/10.0+times,min(c,1.0),min(c,1.0)));
    col += vec4(rc, 1.0);
  }

  return col;
}

void main(){
  vec4 col = vec4(0, 0, 0, 1);

  for(float i = 0.0; i < 10.0; i += 1.0){
    col = drawLine(col, float(mouseX) * i, i / 2.0, (float(size.y) - float(mouseY)) / 10.0 * i);
  }
  gl_FragColor = vec4(col);
}

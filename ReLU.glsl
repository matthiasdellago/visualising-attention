// Visualising the field that a ReLU layer creates in 2d
// Play with the parameters and see what happens!
// Check out more visualisations at github.com/matthiasdellago/visualising-attention

vec2 ReLU(vec2 p) {
  
  vec2 v = vec2(0., 0.);
  
  // define some matrix
  mat2 m = mat2(
   1., -2., 
   1., 0.5
  );
  
  // apply matrix and rectify
  vec2 new_p = max(m*p,0.);
  

  v = new_p - p;

  return v;
}

vec2 get_velocity(vec2 p){
  // get p.x and p.y, the current coordinates
  // return v.x and v.y, the velocity at point p
  return ReLU(p);
}

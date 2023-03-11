// Visualising the field that 3 attention vectors create in 2d,
// using max() instead of softmax()!
// Play with the parameters and see what happens!
// Check out more visualisations at github.com/matthiasdellago/visualising-attention

vec2 attention(vec2 p) {
  
  // init v
  vec2 v = vec2(0., 0.);
  
  // scale defined separately to easily change it. Try it!
  float scale = 3.;
  
  //define attention vectors
  vec2 f1 = scale * vec2(0.,1.5);
  vec2 f2 = scale * vec2(1.,0.);
  vec2 f3 = scale * vec2(-1.5,0);

  // calc projections -> weights
  float w1 = dot(p,f1);
  float w2 = dot(p,f2);
  float w3 = dot(p,f3);
  
  // max operation
  if(w1 >= w2 && w1 >= w3) {
    return f1-p;
  }
  else if (w2 >= w1 && w2 >= w3) {
    return f2-p;
  }
  else {
    return f3-p;
  }
}

vec2 get_velocity(vec2 p){
  // get p.x and p.y, the current coordinates
  // return v.x and v.y, the velocity at point p
  return attention(p);
}

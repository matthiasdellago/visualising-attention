// Visualising the field that 3 attention vectors create in 2d
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

  // softmax
  float sum = exp(w1)+exp(w2)+exp(w3);
  w1 = exp(w1)/sum;
  w2 = exp(w2)/sum;
  w3 = exp(w3)/sum;

  // linear combination
  vec2 new_p = w1*f1 + w2*f2 + w3*f3;
  
  // calc delta of p
  v = new_p - p;

  return v;
}

vec2 get_velocity(vec2 p){
  // get p.x and p.y, the current coordinates
  // return v.x and v.y, the velocity at point p
  return attention(p);
}

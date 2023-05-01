// Example a strong attractor.
// One attention vector  is stationary at (6,0).
// Another is orbiting the origin with a radius of 3.
// When close to the larger attention vector the smaller vectors attractive field is eclipsed,
// and it no longer forms it's own attractor.
// The particle colour depends on the direction of its velocity,
// so an attrator (i.e. a point where particles converge) is easily identifiable because all colours meet there.
// Play with the parameters and see what happens!
// Check out more visualisations at github.com/matthiasdellago/visualising-attention

vec2 attention(vec2 p) {
  
  // init v
  vec2 v = vec2(0., 0.);
  
  // scale defined separately to easily change it. Try it!
  float scale = 3.;
  
  // using frame counter to create oscillating movement.
  float freq = 0.0005;
  float amplitude = 2.;
  float osc = amplitude*fract(frame*freq);
  
  //define attention vectors
  vec2 f1 = scale * vec2(2.,0.);
  vec2 f2 = scale * vec2(cos(2.*3.14*osc),sin(2.*3.14*osc));

  // calc projections -> weights
  float w1 = dot(p,f1);
  float w2 = dot(p,f2);

  // softmax
  float sum = exp(w1)+exp(w2);
  w1 = exp(w1)/sum;
  w2 = exp(w2)/sum;

  // linear combination
  vec2 new_p = w1*f1 + w2*f2;
  
  // calc delta of p
  v = new_p - p;

  return v;
}

vec2 get_velocity(vec2 p){
  // get p.x and p.y, the current coordinates
  // return v.x and v.y, the velocity at point p
  return attention(p);
}

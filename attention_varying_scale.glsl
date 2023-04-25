// Visualising the field that 3 attention vectors create in 2d
// Here we illustrate how the nature of attention changes as the scale changes.
// We keep all attention vectors/tokens stationary,
// but vary the magnitude of all weights before the softmax operation by the same factor.
// Due to the exponential nature of softmax if we scale all up all wieghts,
// post softmax one weight becomes much more dominant, which we can see as more clearly defined attractors.
// This more closely approximates a max() operation: https://github.com/matthiasdellago/visualising-attention/blob/main/attention_hardmax.glsl

// Play with the parameters and see what happens!
// Check out more visualisations at github.com/matthiasdellago/visualising-attention

vec2 attention(vec2 p) {
  
  // init v
  vec2 v = vec2(0., 0.);
  
  float freq = 0.001;
  float exponent = 2.;
  float osc = pow(2.*fract(frame*freq)-1.,exponent);
  // scale defined separately to easily change it. Try it!
  float scale = 1.*min(10.,1./(osc+0.000001));
  
  
  //define attention vectors
  vec2 f1 = vec2(0.,1.5);
  vec2 f2 = vec2(1.,0.);
  vec2 f3 = vec2(-1.5,0);

  // calc projections -> weights
  float w1 = dot(p,f1)*scale;
  float w2 = dot(p,f2)*scale;
  float w3 = dot(p,f3)*scale;

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

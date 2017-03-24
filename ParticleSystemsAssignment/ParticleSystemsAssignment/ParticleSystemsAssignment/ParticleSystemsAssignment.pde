// ======================================================
// TIMOTHY THOMASSON -- PARTICLE ASSIGNMENT
// CART 353
// 2017-03-21
// RILLA KHALED

// The goal of this project is to have the most simple possible visuals for each particle
// so that the character of each particle system is done through movment alone. 
// ======================================================
/////////////////////////////////////////////////////////
// ======================================================


ParticleSystem ps;

void setup() {
  fullScreen();
  ps = new ParticleSystem(new PVector(width/2,50));
}

void draw() {
  background(255);
  // add a new particle each time we call draw as long as there are 
  // fewer than 200 particles in our ps
  
  // note that this will get filled with raindrops over time, since
  // they don't "die"
  if(ps.particles.size() < 200) {
    ps.addParticle();
  }
  ps.run();
}
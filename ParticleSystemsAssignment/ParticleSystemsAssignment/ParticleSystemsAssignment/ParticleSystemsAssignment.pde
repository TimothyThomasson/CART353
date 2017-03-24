// ======================================================
// TIMOTHY THOMASSON -- PARTICLE ASSIGNMENT
// CART 353
// 2017-03-21
// RILLA KHALED

//          (USE ARROW KEYS TO SWAP BETWEEN SYSTEMS)

// ======================================================
/////////////////////////////////////////////////////////
// ======================================================


ParticleSystem ps;

void setup() {
  fullScreen();
  ps = new ParticleSystem(new PVector(width/2,height/2));
  
}

void draw() {
  background(0);
//SET MAX AMOUNT OF PARTICLES TO BE 1000
  if(ps.particles.size() < 1000) {
    ps.addParticle();
  }
  ps.run();
}
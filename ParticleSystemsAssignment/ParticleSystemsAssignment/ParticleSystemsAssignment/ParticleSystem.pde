

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  //CONSTRUCTOR
  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
  }

  // An equal probablity of any type of Particle being added
  void addParticle() {
    if (key == CODED) {
      if (keyCode == UP) {
        background(45,55,56);
        particles.add(new Particle(origin)); 
      } else if (keyCode == DOWN) {
        particles.add(new Sprinkler(origin));
      } else if (keyCode == LEFT) {
        background(#72A567);
        particles.add(new Termites(origin));
      } else {
        particles.add(new Glitches(origin));
      }
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
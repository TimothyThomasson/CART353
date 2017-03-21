class particle {
  PVector x;
  PVector v;
  PVector f;
  particle() {
    x = new PVector(random(0, width), random(0, height));
    v = new PVector();
    f = new PVector();
  }
  void update() {
    v.add(f);
    f = new PVector(0, 0.02);
    x.add(v);
  }
}
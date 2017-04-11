
// LOADS RANDOM OBJECT -- USER CAN ROTATE AND EXAMINE

class RandomObjects { 
  
  PShape s;
  
  LeapMotion leap;

  RandomObjects(LeapMotion leap) {

    this.leap = leap;
    s = loadShape("Toilet.obj");
    lights();
    s.scale(5);
  }

  void display() {

    for (Hand hand : leap.getHands ()) {

      // move the center of rotation 
      // to the center of the sketch
      translate(width/2, height/2);
      directionalLight(0, 20, 100, 0, -1, -10);
      ambientLight(100.0, 200.0, 100);
      background(204);

      pushMatrix();
      noFill();
      stroke(0);
      rotateX(radians(frameCount));
      sphere(1000);
      popMatrix();

      // rotate around the center of the sketch
      rotateX(radians(170)*(hand.getRoll()+150)/400);
      rotateY(radians(170)*hand.getPitch()/400);
      // draw a red dot at 
      // the center of the sketch
      fill(255, 0, 0);

      // draw a rectangle with 
      // its top-left corner
      // at the center of rotation
      fill(255);
      shape(s, 0, 0);
    }
  }


  //USED WHEN WE ARE SELECTING RANDOM OBJ
  //void pickHead() {
  //  int previouslySelectedIndex = selectedHeadIndex;
  //  while (previouslySelectedIndex ==  selectedHeadIndex) {
  //    selectedHeadIndex = int(random(1, 5));
  //    head = loadShape("m"+ selectedHeadIndex + ".obj");
  //  }
  //}

  void setupScenario() {
  }
}

// DIALOUGE BOX MAKES THE IMPRESSION THE PROGRAM HAS CRASHED >>

// ======================================================
class Box {

  LeapMotion leap;

  float xpos;
  float ypos;
  float drag = 30.0;
  PVector fp;

  PImage dialogueBox;

  // ======================================================
  // CONSTRUCTOR - BUILD ANIMATION OBJECT
  Box(LeapMotion leap) {

    this.leap = leap;

    dialogueBox = loadImage("Box.png");
  } // END - CONSTRUCTOR

  // ======================================================
  // FUNCTION - DISPLAY ANIMATION FRAME
  void display() {

    //background(0);

    //GET ARRAY OF ALL HANDS IN VIEW

    Hand rightHandOnScreen = leap.getRightHand();

    if (rightHandOnScreen != null) {

      println("here");
      Finger finger = rightHandOnScreen.getFingers().get(0); 
      PVector fingerPosition = finger.getPosition();

      imageMode(CENTER);
      image(dialogueBox, fingerPosition.x, fingerPosition.y);
    }
  }


  void setupScenario() {
    background(0);
  }
} // END - FUNCTION
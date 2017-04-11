
// WILL CREATE AN ANIMATION THAT WILL TRACK ALONG THE USERS HAND POSITION AND PLAY ACCORDINGLY

// ======================================================
class HandAnimation {
  PImage[] images;
  int imageCount;
  int frame;
  LeapMotion leap;

  PVector lastFingerPosition;

  // ======================================================
  // CONSTRUCTOR - BUILD ANIMATION OBJECT
  HandAnimation(LeapMotion leap) {

    // BRING IN THE LEAP
    this.leap = leap;

    // INIT IMAGE REFERENCE DATA
    String imagePrefix = "frames/HandAnimation";
    int count = 84;

    // SET DEFAULT POSITION FOR LAST FINGER POSITION
    lastFingerPosition = new PVector(width/2, height/2, 0);

    //
    // LOAD IMAGES
    //

    // INIT COUNTER
    imageCount = count;

    // CREATE ARRAY
    images = new PImage[imageCount];

    // LOOP THROUGH IMAGES
    for (int i = 0; i < imageCount; i++) {

      // BUILD FILENAME
      String filename = imagePrefix + (i+1) + ".png";

      // LOAD IMAGE
      images[i] = loadImage(filename);
    }
  } // END - CONSTRUCTOR

  // ======================================================
  // FUNCTION - DISPLAY ANIMATION FRAME
  void display() {

    background(0);

    //GET ARRAY OF ALL HANDS IN VIEW
    Hand rightHandOnScreen = leap.getRightHand();

    // CHECK IF RIGHT HAND FOUND
    if (rightHandOnScreen != null) {

      // GET FIRST FINGER
      Finger finger = rightHandOnScreen.getFingers().get(0); 

      // GET FINGER POSITION
      PVector fingerPosition = finger.getPosition();

      // SET LAST READ FINGER POSITION
      lastFingerPosition = fingerPosition;

      // CALC IMAGE INDEX
      float imageIndex = ((fingerPosition.x)/float(width))*images.length;

      // TRANSLATE IMAGE
      //translate(0, fingerPosition.y);

      // DETECT IF IMAGE INDEX IS WITHIN RANGE
      if (imageIndex < images.length && imageIndex >= 0) {

        // PLACE IMAGE AT INDEX
        imageMode(CENTER);
        image(images[int(imageIndex)], width/2, (fingerPosition.y));
      } else if (imageIndex >= images.length) {

        // PLACE LAST IMAGE (OUT OF RANGE)
        imageMode(CENTER);
        image(images[images.length-1], width/2, (fingerPosition.y));
      } else if (imageIndex <= images.length) {

        imageMode(CENTER);
        image(images[0], width/2, (fingerPosition.y));
      }

      // LOG
      println("finerPosition.x" + fingerPosition.x);
      println("imageIndex" + imageIndex);
      println("iamges.length" + images.length);
    } else {

      // TRANSLATE IMAGE
      translate(0, lastFingerPosition.y/15);

      // CALCULATE INDEX OF IMAGE TO SHOW
      float imageIndex = ((lastFingerPosition.x)/float(width))*images.length;

      // DETECT IF IMAGE INDEX IS WITHIN RANGE
      if (imageIndex < images.length && imageIndex >= 0) {

        // PLACE IMAGE AT INDEX
        imageMode(CENTER);
        image(images[int(imageIndex)], width/2, (lastFingerPosition.y));
      } else if (imageIndex >= images.length) {

        // PLACE LAST IMAGE (OUT OF RANGE)
        imageMode(CENTER);
        image(images[images.length-1], width/2, (lastFingerPosition.y));
      } else if (imageIndex <= images.length) {

        imageMode(CENTER);
        image(images[0], width/2, (lastFingerPosition.y));
      }
    }
  } // END - FUNCTION


  void setupScenario() {
  }
}
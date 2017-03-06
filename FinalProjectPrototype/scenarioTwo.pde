
class Animation {
  PImage[] images;
  int imageCount;
  int frame;

 // ======================================================
 // CONSTRUCTOR - BUILD ANIMATION OBJECT
  Animation() {

    // INIT IMAGE REFERENCE DATA
    String imagePrefix = "frames/monkAnimation";
    int count = 37;

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

  /////////////////////////////////////////////////
  // FUNCTION - DISPLAY ANIMATION FRAME
  void display() {

    background(255, 204, 0);

    //GET ARRAY OF ALL HANDS IN VIEW

    Hand rightHandOnScreen = leap.getRightHand();

    if (rightHandOnScreen != null) {

      Finger finger = rightHandOnScreen.getFingers().get(0); 
      PVector fingerPosition = finger.getPosition();
      float imageIndex = ((fingerPosition.x)/float(width))*images.length;
      println("finerPosition.x" + fingerPosition.x);
      println("imageIndex" + imageIndex);
      println("iamges.length" + images.length);
      if (imageIndex < images.length && imageIndex >= 0) {
        image(images[int(imageIndex)], width/4, height/6);
      }
    } else {

      // CALCULATE INDEX OF IMAGE TO SHOW
      float imageIndex = (float(mouseX)/float(width))*images.length;
      image(images[int(imageIndex)], width/4, height/6);
    }

    //
  } // END - FUNCTION

  void loadEventListeners() {
    //NO EVENT LISTENER TO LOAD
  }

  void destroyEventListeners() {
    //NO EVENT LISTENER TO DESTROY
  }
}
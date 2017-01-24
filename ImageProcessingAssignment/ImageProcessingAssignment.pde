
// ImageProcessingAssignment - CART353
// Timothy Thomasson
// Date: January 24, 2017

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Press "ENTER" to toggle between setting the opacity of the images and setting the solid background colour with mouse movement.
//The solid background color is adjusted to be whatever colour the cursor is hovering over in the image.
//Press the "P" key to toggle a posterization effect to the image.
//Press the "S" key to save the image. 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//here we set our global variables
RemixedImage remix;
boolean isEditOpacity = true;
boolean isPosterized = false;
PImage imgOne;
PImage imgTwo;


//setup to the window to 1080p and load images to variables
void setup() {
  size(1920, 1080); 
  imageMode(CENTER);
  imgOne = loadImage("taxiDriverOne.png");
  imgTwo = loadImage("taxiDriverTwo.png");
  remix = new RemixedImage(imgOne, imgTwo);
}

//event handler to change booleans that indicate key presses
void keyPressed() {
  if (key == ENTER) {
    if (isEditOpacity == true) {
      isEditOpacity = false;
    } else {
      isEditOpacity = true;
    }
  }

  if (key == 's') {
    saveFrame("Remix.png");
  }

  if (key == 'p') {
    if (isPosterized == false) {
      isPosterized = true;
    } else {
      isPosterized = false;
    }
  }
}

//display the images and apply methods from class based on boolean conditionals
void draw() {
  if (isEditOpacity == false) {
    remix.changeBackgroundColour();
  } else {
    remix.changeOpacity();
  }
  if (isPosterized == true) {
    remix.posterizeImage();
  }
}
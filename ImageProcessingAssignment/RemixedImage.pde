
//create the class to remix two images together
class RemixedImage {

  PImage imgOne;
  PImage imgTwo;

  //constructor
  RemixedImage(PImage imgOne, PImage imgTwo) {

    this.imgOne = imgOne;
    this.imgTwo = imgTwo;
  }


  //in this method we use the mouseX position to set the opacities of the images 
  //as the cursor is traversed horizontally across the screen
  void changeOpacity() {
    tint(255);
    image(imgTwo, width/2, height/2);

    tint(255, mouseX/13);
    image(imgOne, width/2, height/2);
  }


  //pull the colour of the particular pixel value from current pixel of the curosr location
  void changeBackgroundColour() {
    //this will get the colour value of a particular pixel based on mouseX and mouseY
    color pixelColour = imgTwo.get(mouseX, mouseY);
    background(pixelColour);
    image(imgTwo, width/2, height/2);
    image(imgOne, width/2, height/2);
  }


  //use posterization effect on images
  void posterizeImage() {
    image(imgTwo, width/2, height/2);
    image(imgOne, width/2, height/2);
    filter(POSTERIZE, 10);
  }
}
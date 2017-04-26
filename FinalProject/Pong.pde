
// CREATE  A LEAP CONTROLLED PONG GAME :) PLAY AGAINST A WALL

// ======================================================
class Pong {

  //CREATE OBJECTS FOR LIBS
  LeapMotion leap;
  Movie background;

  //CREATE VARIABLES FOR SHAPE
  boolean gameStart = false;
  float x = 150;
  float y = 150;
  float speedX = random(10, 40);
  float speedY = random(10, 40);
  int leftColor = 128;
  int rightColor = 128;
  int diam;
  int rectSize = 150;
  float diamHit;
  float yPosition;

  // ======================================================
  // CONSTRUCTOR
  Pong(LeapMotion leap) {
    this.leap = leap;
    ellipseMode(CENTER);
    noStroke();

    //HAD TO COMMENT OUT VIDEO BEACUSE IT CAUSED LAAG>>> :,(
    //background = new Movie(this, "background.mp4");
    //background.loop();
    //background.volume(0);
    //background.frameRate(6);
  }

// ======================================================
  void display() {

    //HAD TO COMMENT OUT VIDEO BEACUSE IT CAUSED LAAG>>> :,(
    //image(background, width/2, height/2, width, height);
    //translate(0, 0);
    //imageMode(CENTER);

    background(255);

    fill(0);
    diam = 20;
    ellipse(x, y, diam, diam);

    getLeapPosition();

    fill(0);
    rect(0, 0, 20, height);
    fill(rightColor);
    rect(width-30, yPosition-rectSize/2, 10, rectSize);


    if (gameStart) {

      x = x + speedX;
      y = y + speedY;

      // if ball hits movable bar, invert X direction and apply effects
      if ( x > width-30 && x < width -20 && y > yPosition-rectSize/2 && y < yPosition+rectSize/2 ) {
        speedX = speedX * -1;
        x = x + speedX;
        rightColor = 0;
        fill(random(0, 128), random(0, 128), random(0, 128));
        diamHit = random(75, 150);
        ellipse(x, y, diamHit, diamHit);
        rectSize = rectSize-10;
        rectSize = constrain(rectSize, 10, 150);
      } 

      // CHANGE DIRECTION ONCE BALL HITS WALL 
      else if (x < 25) {
        speedX = speedX * -1.1;
        x = x + speedX;
        leftColor = 0;
      } else {     
        leftColor = 128;
        rightColor = 128;
      }
      // resets things if you lose
      if (x > width) { 
        gameStart = false;
        x = 150;
        y = 150; 
        speedX = random(10, 15);
        speedY = random(10, 15);
        rectSize = 150;
      }

      // if ball hits up or down, change direction of Y   
      if ( y > height || y < 0 ) {
        speedY = speedY * -1;
        y = y + speedY;
      }
    }
  }
  
// ======================================================
  void getLeapPosition() {
    Hand rightHandOnScreen = leap.getRightHand();

    if (rightHandOnScreen != null) {
      //PONG GAME WILL START ONCE HAND IS BEING DETECTED BY THE LEAP MOTION :)
      gameStart = !gameStart;
      Finger finger = rightHandOnScreen.getFingers().get(0); 
      PVector fingerPosition = finger.getPosition();
      yPosition = fingerPosition.y;
    }
  }

  void setupScenario() {
  }
}

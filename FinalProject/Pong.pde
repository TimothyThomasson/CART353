
//// CREATE  A LEAP CONTROLLED PONG GAME :) PLAY AGAINST A WALL
//// ======================================================








//class Pong {

//  //CREATE OBJECTS FOR LIBS
//  LeapMotion leap;
//  Movie background;

//  //CREATE VARIABLES FOR SHAPE
//  boolean gameStart = false;
//  float x = 150;
//  float y = 150;
//  float speedX = random(100, 100);
//  float speedY = random(100, 100);
//  int leftColor = 128;
//  int rightColor = 128;
//  int diam;
//  int rectSize = 150;
//  float diamHit;
//  float yPosition;




//  Pong(leapMotion leap) {
//  }
//}











//void setup() {
//  leap = new LeapMotion(this);
//  size(1920, 1080);
//  noStroke();
//  smooth();
//  ellipseMode(CENTER);

//  background = new Movie(this, "background.mp4");
//  background.loop();
//  background.volume(0);
//  background.frameRate(6);
//}

//void draw() { 


//  image(background, width/2, height/2, width, height);
//  translate(0, 0);
//  imageMode(CENTER);
//  //background(255);

//  fill(255);
//  diam = 20;
//  ellipse(x, y, diam, diam);

//  getLeapPosition();

//  fill(255);
//  rect(0, 0, 20, height);
//  fill(rightColor);
//  rect(width-30, yPosition-rectSize/2, 10, rectSize);


//  if (gameStart) {

//    x = x + speedX;
//    y = y + speedY;

//    // if ball hits movable bar, invert X direction and apply effects
//    if ( x > width-30 && x < width -20 && y > yPosition-rectSize/2 && y < yPosition+rectSize/2 ) {
//      speedX = speedX * -1;
//      x = x + speedX;
//      rightColor = 0;
//      fill(random(0, 128), random(0, 128), random(0, 128));
//      diamHit = random(75, 150);
//      ellipse(x, y, diamHit, diamHit);
//      rectSize = rectSize-10;
//      rectSize = constrain(rectSize, 10, 150);
//    } 

//    // if ball hits wall, change direction of X
//    else if (x < 25) {
//      speedX = speedX * -1.1;
//      x = x + speedX;
//      leftColor = 0;
//    } else {     
//      leftColor = 128;
//      rightColor = 128;
//    }
//    // resets things if you lose
//    if (x > width) { 
//      gameStart = false;
//      x = 150;
//      y = 150; 
//      speedX = random(3, 5);
//      speedY = random(3, 5);
//      rectSize = 150;
//    }


//    // if ball hits up or down, change direction of Y   
//    if ( y > height || y < 0 ) {
//      speedY = speedY * -1;
//      y = y + speedY;
//    }
//  }
//}

//void getLeapPosition() {
//  Hand rightHandOnScreen = leap.getRightHand();

//  if (rightHandOnScreen != null) {
//    //println("here");
//    Finger finger = rightHandOnScreen.getFingers().get(0); 
//    PVector fingerPosition = finger.getPosition();


//    yPosition = fingerPosition.y;
//  }
//}


//void mousePressed() {
//  gameStart = !gameStart;
//}

//void movieEvent(Movie m) {
//  m.read();
//}
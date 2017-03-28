
import processing.video.*;
import ddf.minim.*;

class Head {

  PShape head;

  Head() {

  }

  void display() {

  }

  void loadEventListeners() {
  }

  void destroyEventListeners() {
  }
}


//Minim minim;
//AudioInput in;
//Movie myMovie;

//float zoff;
//float cell;
//float[][] heights;

//int numCols;
//int numRows;

//void setup() {

//  size(1920, 1080, P3D); 
//  zoff = 1000.0;
//  cell = 10;
//  numCols = 60;
//  numRows = 45;

//  size(width, height);
//  myMovie = new Movie(this, "bars.mp4");
//  myMovie.loop();

//  minim = new Minim(this);
//  // use the getLineIn method of the Minim object to get an AudioInput
//  in = minim.getLineIn();

//  // this array essentially lets us store (x, y, z) values: i and j will let us determine x and y, while the stored val is z
//  heights = new float[numCols][numRows];
//}

//void movieEvent(Movie c) {
//  c.read();
//}

//// calculateHeights() is based on i, j, and a changing value of zoff
//void calculateHeights() {

//  for (int i = 0; i < numCols; i++) {
//    for (int j = 0; j < numRows; j++) {

//      // assign z a perlin noise val based on a mapping of i, a mapping of j, and zoff
//      float z = noise(map(i, 0, numCols, 0, 1), map(j, 0, numRows, 0, 1), zoff);

//      // in heights[i][j], store a new height: a mapped version of z that will vary between -100 and 100
//      for (int k = 0; k < in.bufferSize() - 1; k++)
//      {
//        //we have to multiply the microphone values by 50000 respectively so the effect is actually noticable. 
//        heights[i][j] = map(z, 0, 1, (-in.right.get(i+1)*20000), (in.right.get(i+1)*20000) );
//      }
//    }

//    // change zoff for next time we call draw()
//    zoff += 0.01;
//  }
//}

//void draw() {
//  background(#FFF64B);

//  // fill our heights array with a new set of z vals
//  calculateHeights();


//  myMovie.loadPixels();

//  pushMatrix();
//  translate(-100, 30, -400);
//  rotateX(PI/4);

//  image(myMovie, width, height);

//  for (int i = 0; i < (numCols-1); i++) { 
//    for (int j = 0; j < (numRows-1); j++) { 

//      stroke(255);

//      int multiplier = width/numCols;
//      int loc = (numCols - i*multiplier - 1) + j*multiplier * numCols;
//      loc = constrain(loc, 0, myMovie.pixels.length-1);
//      color c = myMovie.pixels[loc];
//      fill(c);
//      pushMatrix();
//      // translate our point of origin for drawing: jump to where each cell starts
//      translate(i * cell + height/2 + 200, j * cell + height/2, 0);

//      //use quads for custom verticies
//      beginShape(QUADS);

//      //place vertexes for map
//      vertex(0, 0, heights[i][j]);
//      vertex(cell, 0, heights[i+1][j]);
//      vertex(cell, cell, heights[i+1][j+1]);
//      vertex(0, cell, heights[i][j+1]);
//      endShape();

//      // popMatrix so that we can reset the origin for our next quad
//      popMatrix();
//    }

//    //fill(#2F3134);
//    //pushMatrix();
//    //translate(500, 500);
//    //rotateY(radians(frameCount));
//    //sphereDetail(3,4);
//    //sphere(250 + in.right.get(i+1)*200 );
//    //popMatrix();
//  }
//  popMatrix();
//}

int start;
PImage startBar;
PImage recycleBin;
PImage dontDelete;
PImage loseScreen; 
PImage mineSweeper;


Icon[] icons; 
Bin bin;

void setup() {

  background(#008080);
  size(1025, 768);

  loadIcons();

  startBar = loadImage("startBar.png");
  mineSweeper = loadImage("mineSweeper.png");

  start = second();

  bin = new Bin();
}

void draw() {

  background(#008080);
  image(startBar, 0, 740);
  image(mineSweeper, width/2+100, 200);


  for (Icon icon : icons) {
    //println("here");
    //perform movments
    icon.update(bin);
    icon.display();
    icon.checkEdges();
  }

  bin.move(0.001);
  bin.update();
  bin.display();

} 

void loadIcons() {

  icons = new Icon[5];
  icons[0] = new Icon(loadImage("dontDelete.png"), 200, 200);  
  icons[1] = new Icon(loadImage("icon1.png"), 500, 500);
  icons[2] = new Icon(loadImage("icon2.png"), 700, 500);
  icons[3] = new Icon(loadImage("icon3.png"), 300, 500);
  icons[4] = new Icon(loadImage("icon4.png"), 900, 500);
}
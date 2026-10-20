PImage sonic;
PImage sonicRing;
int sonicX, sonicY;
boolean debug = true;
int score = 0;

void setup() {
  size(600, 600);
  sonic = loadImage("sonic.png");
  sonicRing = loadImage("giphy.gif");
  sonicX = 10;
  sonicY = 10;
}

void draw() {
  background(120, 120, 200);
  fill(255, 0, 0);
  textSize(20);
  text("Score: " + score, 10, 30);
  if (debug) {
    text("x", sonicX, sonicY+10);
    rect(sonicX, sonicY, 150, 200);
  }
  image(sonic, sonicX, sonicY, 150, 200);
  if (debug) {
    rect(450, 500, 100, 70);
  }
  image(sonicRing, 450, 500, 100, 70);

  // collision time
  // bottom of sonic touching top of ring
  int topOfSonic = sonicY;
  int bottomOfSonic = topOfSonic + 200;
  int topOfRing = 500;
  if(bottomOfSonic >= topOfRing) {
   println("Touching from above."); 
  }
}

void keyPressed() {
  println("Key " + key + " was pressed (" + keyCode + ")" );
  // up arrow is 38
  // down arrow is 40
  // left arrow is 37
  // right arrow is 39
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    sonicY = sonicY + 10;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    sonicX = sonicX + 10;
  }

  if (key == 'w' || key == 'W' || keyCode == UP) {
    sonicY = sonicY - 10;
  } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
    sonicX = sonicX - 10;
  }

  // bounds check
  if (sonicX < 0) {
    sonicX = 0;
  }
  if (sonicY < 0) {
    sonicY = 0;
  }
  int maxX = width - 150;
  if (sonicX > maxX) {
    sonicX = maxX;
  }
  int maxY = height - 200;
  if (sonicY > maxY) {
    sonicY = maxY;
  }
}

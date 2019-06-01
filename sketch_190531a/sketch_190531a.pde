import processing.sound.*;

SoundFile song;

void setup() {
  size(1040, 800);
  //song = new SoundFile(this, "goodbye.mp3");
  //song.loop();
}      

void rectangleAtTheBottom(float x, float w, float h) {
  float y = 800 - h;
  rect(x, y, w, h);
}

void draw() {
  // Set background color, noStroke and fill color
  background(0, 0, 255);
  noStroke();
  fill(255, 0, 150);
  
  rectangleAtTheBottom(30, 55, 75);
}

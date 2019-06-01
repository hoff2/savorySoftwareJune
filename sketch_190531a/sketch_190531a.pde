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
  background(227, 167, 232);
  noStroke();
  
  fill(43, 63, 114);
  rectangleAtTheBottom(30, 55, 75);
}

import processing.sound.*;

SoundFile song;

void setup() {
  size(1040, 800);
  //song = new SoundFile(this, "goodbye.mp3");
  //song.loop();
}      

void draw() {
  // Set background color, noStroke and fill color
  background(0, 0, 255);
  noStroke();
  fill(255, 0, 150);
  
  rect(30, 20, 55, 55);
}

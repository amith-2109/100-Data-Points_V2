float blink = 0, flash = 0;
float bhX = 600, bhY = 350;
//Setted up global variable blackHolePos by using the class PVector
PVector blackHolePos;
//Defined my array and has the value of 25 items in the list.
Asteroid[] asteroids = new Asteroid[25];
// Color Data bank where the code can fetch from here and use any colour once randomly assigning it to the asteroids.
color[] trailColours = {
  color(255, 70, 110), color(255, 130, 55), color(255, 205, 60), color(205, 240, 65), color(80, 220, 120), color(55, 220, 190), color(65, 210, 255), color(70, 130, 255), color(125, 95, 255), 
  color(190, 80, 255),color(255, 80, 210), color(255, 165, 180), color(180, 255, 230), color(140, 230, 255), color(190, 190, 255),color(255, 240, 150), color(150, 255, 130), color(255, 120, 80),
 color(100, 255, 245), color(210, 125, 90), color(220, 100, 145), color(150, 190, 80), color(80, 180, 150), color(145, 115, 75), color(230, 135, 255)
};
//Calorie Data bank where the code can fetch from here and use any colour once randomly assigning it to the asteroids.
int[] caloriesData = {
  105, 95, 120, 420, 210, 180, 120, 165, 140, 330,90, 520, 620, 190, 50, 270, 150, 220, 195, 200,310, 150, 130, 700, 360
};
//"Time taken to eat" Data bank where the code can fetch from here and use any colour once randomly assigning it to the asteroids.
float[] eatingTimes = {
  3, 4, 12, 18, 10, 14, 7, 5, 6, 11,9, 16, 22, 8, 13, 17, 2, 23, 15, 19,21, 1, 24, 20, 25
};
//runs the blackholes position and the asteorid loop which goes through the list of data assigned to the asteroids for each one.
void setup() {
  size(1280, 720);
  noStroke();
  blackHolePos = new PVector(bhX, bhY);
  
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid(i);
  }
}

void draw() {
  background(0);
  //Text information
  fill(234,0,0);
  textAlign(LEFT, TOP);
  textSize(19);
  text("Food Asteroids!!", 30, 27);
  textSize(12);
  fill(220);
  text("Hover over an asteroid to inspect its data", 30, 51);
  textAlign(RIGHT, TOP);
  textSize(12);
  fill(235);
  text("P: PAUSE / RESUME", width - 18, 24);
  text("R: RESPAWN ALL", width - 18, 43);
  fill(255);
  textSize(11);
  text("SIZE = CALORIES | TRAIL LENGTH = EATING TIME |",width - 18,64);
  textAlign(LEFT, TOP);
  
  // Blink value oscillates between 100 and 255
  float glow = map(cos(blink), -1,1,200,0);

  // AURA
  for (int i = 130; i > 10; i -= 10) {

    // Red -> Orange -> Yellow gradient
    float r = 255;
    float g = map(i, 130, 10, 0, 255);
    float b = 0;
    fill(r, g, b, map(i, 130, 10, 20, 70));
    ellipse(600,360,i * glow * 0.025, i - glow * 0.025);
  }

  // White Glare on the Black Hole
  float glare = map(sin(flash), -1, 1, 100, 255);

  for (int q = 180; q > 20; q -= 10) {
    fill(255, 255, 255, map(q, 120, 20, 5, 40));
    circle(600, 350, q + glare * 0.15);
  }

  flash += 0.2;

  // Outer bright ring
  fill(255, 255, 255);
  ellipse(600, 350, 105, 100);

  // Black hole centre
  fill(0);
  ellipse(600, 351, 100, 100);

  blink -= 0.0009;
} 

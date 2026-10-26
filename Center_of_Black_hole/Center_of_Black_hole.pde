float blink = 0;
float flash = 0;
float bhX = 600;
float bhY = 350;

void setup() {
  size(1280, 720);
  noStroke();
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

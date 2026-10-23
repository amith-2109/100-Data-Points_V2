float blink = 0;
float flash = 0;

void setup() {
  size(1280, 720);
  noStroke();
}

void draw() {
  background(0);
  // Blink value oscillates between 100 and 255
  float glow = map(sin(blink), -1, 1, 100, 255);

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
  fill(255, 255, 255, glow);
  ellipse(600, 350, 105, 100);

  // Black hole centre
  fill(0);
  ellipse(600, 352, 100, 100);

  blink -= 0.0009;
}

float blink = 0;

void setup() {
  size(1280, 720);
  noStroke();
}

void draw() {
  background(0);

  // Blink value oscillates between 100 and 255
  float glow = map(sin(blink), -1, 1, 100, 255);

  // AURA
  for (int i = 120; i > 20; i -= 10) {
    fill(255, 255, 220, map(i, 120, 20, 5, 40));
    circle(100, 100, i + glow * 0.15);
  }

  // OUTER GLOW
  fill(255, 255, 235, 50);
  circle(100, 100, 100);

  // MAIN MOON
  fill(255, 255, 235, glow);
  circle(100, 100, 90);

  // SHADOW CIRCLE TO FORM CRESCENT
  fill(0);
  circle(90, 85, 90);

  blink += 0.05;
}

float blink = 0;

void setup() {
  size(1280, 720);
  noStroke();
}

void draw() {
  background(0);

  // Blink value oscillates
  float glow = map(cos(blink), -1, 1, 160, 300);

  // Aura
  for (int i = 120; i > 0; i--) {
    fill(255, 255, 200, i * 0.6);
    ellipse(width/2, height/2, glow + i*2, glow + i*2);
  }

  // Moon
  fill(255, 255, 220);
  ellipse(width/2, height/2, 200, 200);

  blink += 0.03;
}

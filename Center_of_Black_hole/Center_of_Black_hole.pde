//Data arrays of the calorie, time taken to eat.
float blink = 0;
float flash = 0;
float bhX = 600;
float bhY = 350;
color[] trailColours = {
  color(255, 70, 110), color(255, 130, 55), color(255, 205, 60), color(205, 240, 65), color(80, 220, 120), color(55, 220, 190), color(65, 210, 255),
  color(70, 130, 255), color(125, 95, 255), color(190, 80, 255),
  color(255, 80, 210), color(255, 165, 180), color(180, 255, 230), color(140, 230, 255), color(190, 190, 255),
  color(255, 240, 150), color(150, 255, 130), color(255, 120, 80), color(100, 255, 245), color(210, 125, 90), color(220, 100, 145),
  color(150, 190, 80), color(80, 180, 150), color(145, 115, 75), color(230, 135, 255)
};

int[] caloriesData = {
  105, 95, 120, 420, 210, 180, 120, 165, 140, 330, 90, 520, 620, 190, 50, 270, 150, 220, 195, 200, 310, 150, 130, 700, 360
};

int[] eatingTimes = {
  3, 4, 12, 18, 10, 14, 7, 5, 6, 11, 9, 16, 22, 8, 13, 17, 2, 23, 15, 19, 21, 1, 24, 20, 25
};

Asteroid[] asteroids = new Asteroid[25];

//Aestorid variable for further data input.
void setup() {
  size(1280, 720);
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid(i);
  }
}

void draw() {
  background(0);
  fill(234, 0, 0);
  textSize(21);
  text("Food Asteroids!!", 36, 650);
  fill(255);
  textSize(12);
  text("SIZE = CALORIES | DISTANCE = EATING TIME", 40, 680);
  text( "COLOUR = ORDER OF THE RAINBOW | DISTANCE FROM BLACK HOLE INDICATES THE TIME TAKEN", 40, 695);
  drawBlackHole();
  for (Asteroid x : asteroids) {
    x.display();
  }
}

void drawBlackHole() {
  float glow = map(cos(blink), -1, 1, 200, 0);
  noStroke();

  for (int i = 130; i > 10; i -= 10) {
    fill(255, map(i, 130, 10, 0, 255), 0, map(i, 130, 10, 20, 70));
    ellipse(bhX, bhY + 10, i * glow * 0.025, i - glow * 0.025);
  }
  blink -= 0.0031;
  float glare = map(sin(flash), -1, 1, 100, 255);
  for (int q = 180; q < 20; q -= 10) {
    fill(255, 255, 255, map(q, 120, 20, 5, 40));
    circle(bhX, bhY, q + glare * 0.15);
  }

  fill(255);
  ellipse(bhX, bhY, 105, 100);
  fill(0);
  ellipse(bhX, bhY + 1, 100, 100);
  flash += 0.2;
}

class Asteroid {
  float x;
  float y;
  float asteroidSize;
  float eatingTime;
  color asteroidColour;
  float calories;

  Asteroid(int index) {
    calories = caloriesData[index];
    eatingTime = eatingTimes[index];
    asteroidColour = trailColours[index];
    asteroidSize = map(calories, 90 , 700, 5.5, 14) * 1.7;

    float angle = map(index, 0, 25, 0, 6.7) + random(-0.12, 0.12);
    float distanceFromHole = map(eatingTime, 1, 25, 125, 310);

    x = bhX + cos(angle) * distanceFromHole;
    y = bhY + sin(angle) * distanceFromHole;
  }
//more draw functions to draw the asteroids relative to the data.
  void display() {
    drawAura();
    drawMainasteroid();
  }
//Aura around the asteoirds 
  void drawAura() {
    noStroke();
    for (int i = 8; i > 0; i--) {
      float s = asteroidSize + i * 5;
      fill(red(asteroidColour), green(asteroidColour), blue(asteroidColour), map(i, 8, 1, 8, 35));
      circle(x, y, s);
    }
  }
//Dark spots and drawing the asteroid and its cratrers.
  void drawMainasteroid() {
    fill(red(asteroidColour), green(asteroidColour), blue(asteroidColour), 120);
    circle(x, y, asteroidSize * 1.5);

    fill(255);
    circle(x, y, asteroidSize);

    fill(0);
    circle(x, y-4, 3);
    circle(x, y+4, 2);
    circle(x + 20 * 0.20, y + 10 * 0.12, 2);
  }
}

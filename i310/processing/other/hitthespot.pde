float x, y;

void setup() {
  size(500, 500);
}

void draw() {
  background(255, 255, 255);
  fill(255, 0, 0);
  ellipse(x, y, 20, 20);
}

void mouseClicked() {
  if (dist(mouseX, mouseY, x, y) < 20) {
  x = random(width);
  y = random(height);
  }
}
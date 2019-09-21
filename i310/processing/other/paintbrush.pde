float b = 0.0;

void setup() {
  size(500, 500);
  fill(0, 0, 0);
}

void draw() {
  ellipse(mouseX, mouseY, b, b);
  ellipse(width-mouseX, mouseY, b, b);
  if (mousePressed) { b += 0.1; }
  else { b = 0.0; }
}
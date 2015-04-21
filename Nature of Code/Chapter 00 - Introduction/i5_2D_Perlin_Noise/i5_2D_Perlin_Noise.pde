
void setup() {
  size(400, 400);
}
void draw() {
  loadPixels();

  float xoff = 0.0;  // Start xoff at 0.

  for (int x = 0; x < width; x++) {

    float yoff = 0.0;

    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
      pixels[x+y * width] = color(bright, bright, bright);
      yoff += 0.01 * mouseY;
    }
    xoff += 0.01 * mouseX;
  }

  updatePixels();
}


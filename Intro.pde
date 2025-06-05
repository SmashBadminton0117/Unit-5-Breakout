//Finished Intro:

void Intro() {
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount % 7 == 0) {
    f++;
  }

  if (f == numberOfFrames) f = 0;

  // Title text:
  fill(255);
  textFont(Breakout);
  textSize(277);
  text("Breakout", width / 2, height / 2);

  // Button to --> mode == PLAY
  button();
  tactile(width / 2, height / 2 + 170, 150, 70);

  // Button:
  if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    if (mousePressed) {
      mode = GAME;
    }
  }
}

void button() {
  textSize(57);
  textAlign(CENTER, CENTER);
  text("PLAY", width / 2, height / 2 + 170);
}

void tactile(int x, int y, int w, int h) {
  // Detect mouse hover:
  if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    fill(255, 255, 255, 150);
  } else {
    fill(255, 255, 255, 225);
  }
  stroke(white);
  strokeWeight(3);
  rect(x, y, w, h, 20);
}

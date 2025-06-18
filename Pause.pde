void pausescreen() {
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
  text("PAUSE", width / 2, height / 2);

  // Button to --> mode == INTRO
  buttonPause();
  tactilePause(width / 2, height / 2 + 170, 320, 70);

  // Button:
  if (mouseX > width / 2 - 160 && mouseX < width / 2 + 160 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    if (mousePressed) {
      mode = GAME;
    }
  }
}



void buttonPause() {
  textSize(57);
  textAlign(CENTER, CENTER);
  text("CLICK TO RESUME", width / 2, height / 2 + 170);
}

void tactilePause(int x, int y, int w, int h) {
  // Detect mouse hover:
  if (mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2) {
    fill(255, 255, 255, 150);
  } else {
    fill(255, 255, 255, 225);
  }
  stroke(white);
  strokeWeight(3);
  rect(x, y, w, h, 20);
}

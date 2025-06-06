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

    //Pause Button:
    pauseButtonClicks(width - 100, height - 50, 60, 60, 20);
    pauseButton();

    if (mouseX > width - 130 && mouseX < width / 2 + 130 && mouseY > height - 50 - 30 && mouseY < height - 50 + 30) {
      if (mousePressed) {
        mode = PAUSE;
      }
    }
  }
}


void pauseButton() {
  noStroke();
  rect(width - 100, height - 50, 60, 60, 20);
  image(pauseButton, width - 125, height - 75, 50, 50);
}

void pauseButtonClicks(int x, int y, int w, int h, int c) {
  // Detect mouse hover:
  if (mouseX > width - 130 && mouseX < width / 2 + 130 && mouseY > height - 50 - 30 && mouseY < height - 50 + 30) {
    fill(0);
    //fill(255, 255, 255, 175);
  } else {
    fill(255, 255, 255, 125);
  }
  stroke(white);
  strokeWeight(3);
  rect(x, y, w, h, 20);
}


void buttonPause() {
  textSize(57);
  textAlign(CENTER, CENTER);
  text("CLICK TO RESUME", width / 2, height / 2 + 170);
}

void tactilePause(int x, int y, int w, int h) {
  // Detect mouse hover:
  if (mouseX > width / 2 - 160 && mouseX < width / 2 + 160 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    fill(255, 255, 255, 150);
  } else {
    fill(255, 255, 255, 225);
  }
  stroke(white);
  strokeWeight(3);
  rect(x, y, w, h, 20);
}

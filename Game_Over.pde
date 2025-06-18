//Finished Gameover:

void gameover() {
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount % 7 == 0) {
    f++;
  }

  if (f == numberOfFrames) f = 0;

  // Title text:
  fill(255);
  textFont(Breakout);
  textSize(177);
  if ( life == 0 ) {

    //YOU LOSE section:
    text("YOU LOSE!", width / 2, height / 2);
    //Losing Music:
    intro.stop();
    losing.loop();
    losing.amp(1);

    //Reset to INTRO:
    if ( mode == INTRO ) {
      losing.stop();
      intro.loop();
      intro.amp(1);
    }
  } else {

    //YOU WIN section:
    text("YOU WIN!", width / 2, height / 2);
    //Winning Music:
    intro.stop();
    winning.loop();
    winning.amp(1);

    //Reset to INTRO:
    if ( mode == INTRO ) {
      winning.stop();
      intro.loop();
      intro.amp(1);
    }
  }



  // Button to --> mode == PLAY AGAIN == INTRO
  buttonGameOver();
  gameoverClicks(width / 2, height / 2 + 170, 220, 70);

  // Button:
  if (mouseX > width / 2 - 110 && mouseX < width / 2 + 110 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    if (mousePressed) {
      mode = INTRO;
      points = 0;
      life = 3;
    }
  }
}

void buttonGameOver() {
  textSize(57);
  textAlign(CENTER, CENTER);
  text("PLAY AGAIN", width / 2, height / 2 + 170);
}



void gameoverClicks(int x, int y, int w, int h) {
  // Detect mouse hover:
  if (mouseX > width / 2 - 110 && mouseX < width / 2 + 110 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    fill(255, 255, 255, 150);
  } else {
    fill(255, 255, 255, 225);
  }
  stroke(white);
  strokeWeight(3);
  rect(x, y, w, h, 20);
}

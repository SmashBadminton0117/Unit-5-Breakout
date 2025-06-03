void Intro() {
  image(gif[f], 0, 0, width, height);
  println(frameCount);
  if (frameCount % 7 == 0) {
    f++;
  }

  if ( f == numberOfFrames ) f = 0;

  //Title text:
  fill(white);
  textFont(Breakout);
  textSize(277);
  text("Breakout", width / 2, height / 2);

  //Button to --> mode == PLAY
  rect(width / 2, height / 2 + 170, 150, 70);
  button();

  if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 && mouseY > height / 2 + 170 - 35 && mouseY < height / 2 + 170 + 35) {
    if (mousePressed) {
      mode = GAME;
    }
  }
}

void button() {
  textSize(57);
  textAlign(CENTER, CENTER);
  fill(#A2A1A1);
  text("PLAY", width / 2, height / 2 + 170);
}

void gameover() {
  background(255, 0, 0);
  textFont(Breakout);
  textSize(177);
  text("GAME OVER", width / 2, height / 2);
}

void gameoverClicks() {
  mode = INTRO;
}

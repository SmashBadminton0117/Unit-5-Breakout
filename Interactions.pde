
void keyPressed() {
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 'd' || key == 'D') dKey = true;
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 's' || key == 'S') sKey = false;

  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = false;
}

void keyReleased() {

  if (key == 'a') aKey = false;
  if (key == 'd') dKey = false;
  if (key == 'w') wKey = false;
  if (key == 's') sKey = false;

  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
}

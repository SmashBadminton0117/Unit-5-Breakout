// Lawrence Mo
// Unit 5 Project: Breakout
// May 21st 2025

//Color Palette:
color white      = 255;
color black      = 0000000;
color darkPurple = #42213D;
color pink       = #F57FEF;
color blue       = #5576F7;
color green      = #7E8C1F;

//paddle values:
float paddleX, paddleY, paddleD;

//brick value:
float brickD;
int[] x;
int[] y;

//ball value: Player default
float ballX, ballY, ballD;

//velocity of ball:
float ballVelocityX, ballVelocityY;

// Key Variables: -------------------------------
boolean aKey, dKey, wKey, sKey;
boolean leftKey, rightKey, upKey, downKey;



//array list:

void setup() {
  size(1200, 800);
  
  //paddle positions + size:
  paddleX = width/2;
  paddleY = height; 
  paddleD = 150;
  
  //bricks array:
  brickD = 100;
  x = new int[3];
  y = new int[3];
  
  x[0] = 100;
  y[0] = 100;
  
  x[1] = width / 2;
  y[1] = 100;
  
  x[2] = 1100;
  y[2] = 100;
  
}

void draw() {
  game();
}

void game() {
  background(blue);
  
  //paddle -- Player A
  fill(white);
  stroke(white);
  circle(paddleX, paddleY, paddleD);
  if (aKey) paddleX -= 5;
  if (dKey) paddleX += 5;
  
  //bricks: 3 different positions
  circle(x[0], y[0], brickD);
  circle(x[1], y[1], brickD);
  circle(x[2], y[2], brickD);
  
}


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

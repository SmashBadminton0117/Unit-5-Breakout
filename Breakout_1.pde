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

//brick position placements:
int n;

//ball value: Player default
float ballX, ballY, ballD;

//velocity of ball:
float randomized;
float ballVelocityX, ballVelocityY;


// Key Variables: -------------------------------
boolean aKey, dKey, wKey, sKey;
boolean leftKey, rightKey, upKey, downKey;



//array list:

void setup() {
  size(1200, 800);

  //paddle positions + size:
  paddleX = width / 2;
  paddleY = height;
  paddleD = 150;

  //bricks array:
  brickD = 50;
  int n = 7;
  x = new int[n];
  y = new int[n];

  x[0] = 100;
  y[0] = 100;

  x[1] = width / 2;
  y[1] = 100;

  x[2] = 1100;
  y[2] = 100;
  
  x[3] = 100;
  y[3] = 200;
  
  x[4] = width / 2;
  y[4] = 200;
  
  x[5] = 1100;
  y[5] = 200;


  //ball position + velocity:
  ballX = width / 2;
  ballY = height / 2;
  ballD = 17;

  //velocity:
  ballVelocityX = 0;
  ballVelocityY = 3;
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
  
  //paddle + ball interactions:
  if ( dist(paddleX, paddleY, ballX, ballY) < paddleD / 2 + ballD / 2) {
    ballVelocityX = (ballX - paddleX) / 10;
    ballVelocityY = (ballY - paddleY) / 10;
  }

  //bricks: different positions
  
  int i = 0;
  while ( i < 6) {
    circle(x[i], y[i], brickD);
    i += 1;
      if ( dist(paddleX, paddleY, x[i], y[i]) < paddleD / 2 + brickD / 2) {
        ballVelocityX = (ballX - x[i]) / 10;
        ballVelocityY = (ballY - y[i]) / 10;  
    } 
  }



  // ball: Player Default
  fill(white);
  stroke(black);
  strokeWeight(2);
  circle(ballX, ballY, ballD);

  // Ball movement
  ballX += ballVelocityX;
  ballY += ballVelocityY;
  
  //boundaries of the ball
  if (ballX > width || ballX < 0) {
    ballVelocityX *= -1;
  }

  if (ballY > height || ballY < 0) {
    ballVelocityY *= -1;
  }
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

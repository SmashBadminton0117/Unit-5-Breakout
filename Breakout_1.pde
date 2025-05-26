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
'

//points + life system:
int points, life;


// Key Variables: -------------------------------
boolean aKey, dKey, wKey, sKey;
boolean leftKey, rightKey, upKey, downKey;





void setup() {
  size(1200, 800);

  //paddle positions + size:
  paddleX = width / 2;
  paddleY = height + 7;
  paddleD = 150;

  //bricks array list:
  brickD = 50;
  int cols = 7;
  int rows = 3;
  n = cols * rows;

  int row = 0;
  int index = 0;

  x = new int[n];
  y = new int[n];

  int startX = 100;
  int spacingX = 140;
  int startY = 100;
  int spacingY = 70;

  while (row < rows) {
    int col = 0;
    while (col < cols) {
      x[index] = startX + col * spacingX;
      y[index] = startY + row * spacingY;
      index++;
      col++;
    }
    row++;
  }


  //ball position + velocity:
  ballX = width / 2;
  ballY = height / 2;
  ballD = 17;

  //velocity:
  ballVelocityX = 0;
  ballVelocityY = 3;

  //points + life system calculations:
  points = 0;
  life = 3;
}


void draw() {
  game();
}

void game() {
  //background color of the game
  background(blue);

  //points + life system:
  textSize(27);
  String sp = str(points);
  String sl = str(life);

  text("POINTS:", width / 8, height - 30);
  text("LIFE:", width - 270, height - 30);
  text(sp, width - 950, height - 30);
  text(sl, width - 210, height - 30);


  //paddle -- Player A
  fill(white);
  stroke(white);
  circle(paddleX, paddleY, paddleD);
  if (aKey && paddleX > paddleD / 2 + 2) paddleX -= 5;
  if (dKey && paddleX < width - paddleD / 2 - 4) paddleX += 5;


  //paddle + ball interactions:
  if ( dist(paddleX, paddleY, ballX, ballY) < paddleD / 2 + ballD / 2) {
    ballVelocityX = (ballX - paddleX) / 10;
    ballVelocityY = (ballY - paddleY) / 10;
  }

  //bricks: different positions

  int i = 0;
  while ( i < n) {
    circle(x[i], y[i], brickD);

    if ( dist(ballX, ballY, x[i], y[i]) < ballD / 2 + brickD / 2) {
      ballVelocityX = (ballX - x[i]) / 5;
      ballVelocityY = (ballY - y[i]) / 5;
    }
    i++;
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
  if (ballX > width - ballD / 2 || ballX < 0 + ballD / 2) {
    ballVelocityX *= -1;
  }

  if (ballY < 0 + ballD / 2) {
    ballVelocityY *= -1;
  }

  //Separate Function: When ball passes the paddle
  if (ballY > height + ballD / 2 + 17) {
    ballX = width / 2;
    ballY = height / 2;
    life -= 1;
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

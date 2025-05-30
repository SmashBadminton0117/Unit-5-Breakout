// Lawrence Mo
// Unit 5 Project: Breakout
// May 21st 2025

//Mode Frameworks:
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

//Color Palette:
color white       = 255;
color black       = 0000000;
color blue1       = #62D0F4;
color blue2       = #54B8F4;
color blue3       = #4DAAF3;
color blue4       = #4399F3;
color blue        = #347EF2;

//paddle values:
float paddleX, paddleY, paddleD;

//brick value:
float brickD;
int[] x;
int[] y;

int tempX, tempY;

//brick position placements:
int n;

//brick placements:
boolean[] alive;

//ball value: Player default
float ballX, ballY, ballD;

//velocity of ball:
float randomized;
float ballVelocityX, ballVelocityY;


//points + life system:
int points, life;


// Key Variables: -------------------------------
boolean aKey, dKey, wKey, sKey;
boolean leftKey, rightKey, upKey, downKey;





void setup() {
  
  //Mode Framework: Intro
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;
  
  size(1200, 800);

  //paddle positions + size:
  paddleX = width / 2;
  paddleY = height + 7;
  paddleD = 150;

  //bricks array list:
  brickD = 50;
  n = 44;

  x = new int[n];
  y = new int[n];
  alive = new boolean[n];

  tempX = tempY = 100;


  int i = 0;
  while ( i < n ) {
    x[i] = tempX;
    y[i] = tempY;
    alive[i] = true;
    tempX += 100;

    if ( tempX == width ) {
      tempX = 100;
      tempY += 100;
    }
    i++;
  }


  //ball position + velocity:
  ballX = width / 2;
  ballY = height / 2 + 50;
  ballD = 17;

  //velocity:
  ballVelocityX = 0;
  ballVelocityY = 2;

  //points + life system calculations:
  points = 0;
  life = 3;
}


void draw() {
  //if ( mode == INTRO ) {
  //  Intro();
  //} else if ( mode == GAME ) {
  //  game();
  //} else if ( mode == PAUSE ) {
  //  pausescreen();
  //} else if ( mode == GAMEOVER ) {
  //  gameover();
  //} else {
  //  println(" Mode Error: Mode is " + mode);
  //}
  
  game();
}




void game() {
  //background color of the game
  background(blue);

  //points + life system:
  textSize(27);

  text("POINTS:", width / 8, height - 30);
  text("LIFE:", width - 270, height - 30);
  text(points, width - 950, height - 30);
  text(life, width - 210, height - 30);


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
    ballY = height / 2 + 50;
    ballVelocityX = 0;
    ballVelocityY = 2;
    life -= 1;
  }

  //Manage bricks: breaking bricks

  int i = 0;
  while ( i < n ) {
    if ( alive[i] == true ) {
      manageBricks (i);
    }
    i++;
  }
}




void manageBricks(int i) {
  int rowIndex = i / 7;

  stroke(white);
  strokeWeight(1);
  if (rowIndex == 0) fill(blue4);
  else if (rowIndex == 1) fill(blue3);
  else if (rowIndex == 2) fill(blue2);
  else if (rowIndex == 3) fill(blue1);

  circle(x[i], y[i], brickD);

  // Brick and ball collision
  if (dist(ballX, ballY, x[i], y[i]) < ballD / 2 + brickD / 2) {
    ballVelocityX = (ballX - x[i]) / 5;
    ballVelocityY = (ballY - y[i]) / 5;
    alive[i] = false;
  }
}

void gameClicks() {
  if (true) {
  }
}

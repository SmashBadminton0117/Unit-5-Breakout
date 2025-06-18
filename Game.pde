void game() {
  //background color of the game
  background(blue);

  //points + life system:
  textSize(27);

  text("POINTS:", width / 8, height - 30);
  text("LIFE:", width - 270, height - 30);
  text(points, width - 980, height - 30);
  text(life, width - 210, height - 30);

  //Pause Button:
  pauseButton();
  pauseButtonClicks(width - 100, height - 50, 60, 60, 20);
  image(pauseButton, width - 130, height - 80, 60, 60);


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
    bouncing.stop();
    bouncing.play();
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

  //Finish game:
  if ( points == 44 ) {
    mode = GAMEOVER;
  }

  //Separate Function: When ball passes the paddle
  if (ballY > height + ballD / 2 + 17) {
    ballX = width / 2;
    ballY = height / 2 + 50;
    ballVelocityX = 0;
    ballVelocityY = 2;
    life -= 1;

    //Sound Effects:
    losing.stop();
    losing.play();

    //Different modes:
    if ( life == 0 ) {
      mode = GAMEOVER;
    }
  }

  //Manage bricks by brick: breaking bricks
  int i = 0;
  while ( i < n ) {
    if ( alive[i] == true ) {
      manageBricks (i);
    }
    i++;
  }
}


void pauseButton() {
  noStroke();
  rect(width - 100, height - 50, 60, 60, 20);
}

void pauseButtonClicks(int x, int y, int w, int h, int c) {
  // Detect mouse hover:
  if (mouseX >= x - 30 && mouseX <= x + w - 30 && mouseY >= y - 30 && mouseY <= y + h - 30) {
    fill(255, 255, 255, 150);
  } else {
    fill(255, 255, 255, 255);
  }
  stroke(white);
  strokeWeight(3);
  rect(x, y, w, h, 20);
}

void mousePressed() {
  int x = width - 130;
  int y = height - 80;
  int w = 60;
  int h = 60;

  if (mouseX >= x && mouseX <= x + w &&
    mouseY >= y && mouseY <= y + h) {
    mode = PAUSE;
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
    points += 1;
    scoring.stop();
    scoring.play();
  }
}

import processing.sound.*;

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


//Fonts:
PFont Breakout;

//GIF:
PImage[] gif;
int numberOfFrames;
int f = 0;

//Pause Button:
PImage pauseButton;

//Sound Library:
SoundFile bouncing;
SoundFile scoring;
SoundFile intro;
SoundFile pause;
SoundFile winning;
SoundFile losing;



void setup() {
  //Paper size:
  size(1200, 800);

  //Sound Files:
  bouncing = new SoundFile(this, "bouncingMusic.wav");
  scoring = new SoundFile(this, "scoringMusic.wav");
  intro = new SoundFile(this, "MUSIC.mp3");
  pause = new SoundFile(this, "pauseButton.wav");
  winning = new SoundFile(this, "youWin.wav");
  losing = new SoundFile(this, "youLose.wav");

  //Music: Background Music
  intro.loop();
  intro.amp(1);

  //Zoom Loop:
  numberOfFrames = 33;
  gif = new PImage[ numberOfFrames ];

  int f = 0;
  while ( f < numberOfFrames ) {
    gif[f] = loadImage("frame_"+f+"_delay-0.1s.gif");
    f++;
  }

  //Pause Button Image:
  pauseButton = loadImage("pauseButton.png");



  //Font: Mode Framework
  Breakout = createFont("Breakout.ttf", 77);

  //Mode Framework: Intro
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;

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
  if ( mode == INTRO ) {
    Intro();
  } else if ( mode == GAME ) {
    game();
  } else if ( mode == PAUSE ) {
    pausescreen();
  } else if ( mode == GAMEOVER ) {
    gameover();
  } else {
    println(" Mode Error: Mode is " + mode);
  }
}

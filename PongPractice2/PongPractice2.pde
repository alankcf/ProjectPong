import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound
Minim minim;
AudioPlayer intro, theme, point, leftpaddle, rightpaddle, wall, clapping;

// Pong
// Alan Fung
// Oct 15, 2020


//mode framework
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;
//final int OPTIONS= 5;

//colors
color pink = #FF008D;
color green = #00FF3D;
color white = #FFFFFF;
color brown = #45201E;
color red = #FA0303;
color orange = #FA8303;
color blue = #03ADFA;
color yellow = #E8BB3F;
color darkyellow = #FFAC12;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float vx, vy; //target velocity

//scoring
int leftscore, rightscore, timer;

// keyboard variables
boolean wkey, skey, upkey, downkey;

boolean AI;

void setup() {
  size(800, 600);
  mode = INTRO;
  //mode = GAME;
  
  //initalize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  //vx = random(-5, 5);
  //vy = random (-5, 5);
  vx = vx + 3;
  vy = vy + 3;
  
  //initalize score
  rightscore = leftscore = 0;
  timer = 100;
  
  //initalize keyboard vars
  wkey = skey = upkey = downkey = false;
  
  //minim
  minim = new Minim(this);
  //theme = minim.loadFile(" ");
  point = minim.loadFile("point.wav");
  leftpaddle = minim.loadFile("leftpaddle.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  wall = minim.loadFile("wall.wav");
  clapping = minim.loadFile("clapping.wav");
  intro = minim.loadFile("intro.wav");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}

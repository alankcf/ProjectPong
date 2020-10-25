void intro() {
  background(darkyellow);
  clapping.pause();
  fill(red);
  strokeWeight(3);
  textSize(100);
  textAlign(CENTER);
  text("PONG", 400, 200);
  intro.play();


  //ball
  strokeWeight(3);
  stroke(yellow);
  fill(orange);
  circle(ballx, bally, balld);
  ballx = ballx + vx;
  bally = bally + vy;

  if (bally < (balld/2) || bally > height-(balld/2)) {
    //wall
    vy = vy * -1;
  }

  if (ballx < (balld/2) || ballx > width - (balld/2)) {
    vx = vx * -1;
  }

  //buttons
  fill(white);
  strokeWeight(3);
  rectMode(CENTER);
  textSize(60);
  tactileOptions();
  rect(200, 500, 300, 125);
  fill(0);
  text("1 Player", 200, 525);
  strokeWeight(3);
  tactileOptions2();
  fill(255);
  rect(600, 500, 300, 125);
  fill(0);
  text("2 Player", 600, 525);
}

void introClicks() {
  //mode = GAME;
  // 1 player
  if (mouseX > 50 && mouseX < 350 && mouseY > 300 && mouseY < 625) {
    mode = GAME;
    intro.pause();
    intro.rewind();
    AI = true;
    ballx = width/2;
    bally = height/2;
  }
  //2 player
  if (mouseX > 450 && mouseX < 750 && mouseY > 300 && mouseY < 625) {
    mode = GAME;
    intro.pause();
    intro.rewind();
    AI = false;
    ballx = width/2;
    bally = height/2;
  }
}

void tactileOptions() {
  if (mouseX > 50 && mouseX < 350 && mouseY > 300 && mouseY < 625) {
    stroke(0);
    strokeWeight(5);
  } else {
    stroke(yellow);
    strokeWeight(3);
  }
}
void tactileOptions2() {
  if (mouseX > 450 && mouseX < 750 && mouseY > 300 && mouseY < 625) {
    stroke(0);
    strokeWeight(5);
  } else {
    stroke(yellow);
    strokeWeight(3);
  }
}

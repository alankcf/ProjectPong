void game() {
  intro.pause();
  background(yellow);
  fill(white);
  clapping.pause();
  fill(red);
  stroke(red);
  rectMode(CORNER);
  rect(390, 475, 2, 50);
  rect(410, 475, 2, 50);

  // center line
  strokeWeight(3);
  stroke(255);
  line(width/2, 0, width/2, height);

  //scoreboard
  textSize(50);
  fill(blue);
  text(leftscore, width/4, 100);
  fill(red);
  text(rightscore, 3*width/4, 100);
  //text(timer, 3*width/4, 550);
  timer = timer - 1;

  fill(white); 

  // paddles
  fill(blue);
  circle(leftx, lefty, leftd);
  fill(red);
  circle(rightx, righty, rightd);

  //move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;

  if (AI == false) {
    if (upkey == true) righty = righty - 5;
    if (downkey == true) righty = righty + 5;
  } else {
    if (ballx > (2 *width/4)) {
      if (bally > righty) {
        righty = righty + 5;
      }
      if (bally < righty) {
        righty = righty - 5;
      }
    }
  }

  //limits to paddles
  if (lefty - 25 < (leftd/2)) {
    lefty = lefty + 5;
  }
  if (lefty + 25 > height-(leftd/2)) {
    lefty = lefty - 5;
  }

  if (righty - 25  < (rightd/2)) {
    righty = righty + 5;
  }
  if (righty + 25 > height-(rightd/2)) {
    righty = righty - 5;
  }

  // ball
  fill(orange);
  circle(ballx, bally, balld);

  // move ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }
  
  // limits to ball
  if (bally > height-(balld/2)) {
    bally = bally - 2;
  }
  if (bally < (balld/2)) {
    bally = bally + 2;
  }

  
  //scoring 
  if (ballx < 0) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    point.rewind();
    point.play();
  }
  if (ballx > 800) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    point.rewind();
    point.play();
  }

  //collusion code
  if (bally < (balld/2) || bally > height-(balld/2)) {
    //wall
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }

  if (dist(leftx, lefty, ballx, bally) <= (balld/2) + (leftd/2)) {
   
    vx = ((ballx - leftx)/15)* 1.2;
    vy = ((bally - lefty)/15) * 1.2;
    //ballx = (ballx + vx) * 1.1;
    leftpaddle.rewind();
    leftpaddle.play();
  }
  if (dist(rightx, righty, ballx, bally) <= (balld/2) + (rightd/2)) {
   
    vx = ((ballx - rightx)/15)* 1.2;
    vy = ((bally - righty)/15)* 1.2;
   
    rightpaddle.rewind();
    rightpaddle.play();
  }
  if (leftscore == 3) {
    mode = GAMEOVER;
    clapping.play();
  }
  if (rightscore == 3) {
    mode = GAMEOVER;
    clapping.play();
  }
}


void gameClicks() {
    mode = PAUSE;
    fill(yellow);
    stroke(yellow);
    rectMode(CORNER);
    rect(390, 475, 2, 50);
    rect(410, 475, 2, 50);
    fill(red);
    triangle(380, 475, 380, 525, 425, 500);
    
    
  
}

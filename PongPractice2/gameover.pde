void gameover() {
  clapping.play();
  // left wins
  if (leftscore > rightscore) {
    clapping.play();
    textAlign(CENTER);
    textSize(50);
    stroke(0);
    strokeWeight(1);
    text("LEFT PLAYER WINS!", 400, 300);

    //making it 3
    fill(yellow);
    strokeWeight(1);
    stroke(yellow);
    rect(150, 50, 100, 100);
    fill(blue);
    textSize(50);
    text("3", width/4, 100);
  } else {
    // right wins
    //clapping.rewind();
   clapping.play();
    //background(red);
    textAlign(CENTER);
    textSize(80);

    //making it 3
    fill(yellow);
    strokeWeight(1);
    stroke(yellow);
    rect(550, 50, 100, 100);
    fill(red);
    textSize(50);
    text("3", 3 *width/4, 100);

    if (AI == false) {
      stroke(0);
      strokeWeight(1);
      text("RIGHT PLAYER WINS!", 400, 300);
    } else {
      stroke(0);
      strokeWeight(1);
      text("COMPUTER WINS!", 400, 300);
    }
  }
}

void gameoverClicks() {
  mode = INTRO;
  leftscore = 0;
  rightscore = 0;
  righty = lefty = 300;
  clapping.rewind();
  if (mouseX > 550 && mouseY < 750 && mouseY > 650 && mouseY < 750) {
    exit();
  }
}
void tactileQuit() {
  if (mouseX > 550 && mouseY < 750 && mouseY > 650 && mouseY < 750) {
    strokeWeight(5);
  } else {
    strokeWeight(3);
  }
}

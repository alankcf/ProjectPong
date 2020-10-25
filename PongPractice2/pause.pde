void pause() {
  fill(0);
  textSize(40);
  textAlign(CENTER);
  fill(0);
  text("GAME PAUSED", 400, 300);
}

void pauseClicks() {
  mode = GAME;
  rect(390, 475, 2, 50);
  rect(410, 475, 2, 50);
}

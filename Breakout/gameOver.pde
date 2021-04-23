void gameOver() {
  music.pause();
  imageMode(CORNER);
  background(orange);
  noStroke();
  fill(blue);
  rect(0, 0, 800, 300);
  //gif 
  image(wind[f], 0, 30);
  if (frameCount % 3==0)f++;
  if (f==frames) f=0;
  //text 
  textSize(70);
  if (lives==0) {
    fill(white);
    text("YOU LOST", 395, 95);
    fill(brown);
    text("YOU LOST", 400, 100);
    loss.play();
  }

  if (score==30) {
    fill(white);
    text("YOU WON", 395, 95);
    fill(brown);
    text("YOU WON", 400, 100);
    end.play();
  }

  //images
  image(hayBail, 0, 345, 256, 256);
  image(hayStack, 544, 345, 256, 256);
  image(cow, 300, 230, 256, 256);
}

void gameOverClicks() {
  int i=0;
  while (i<n) {
    alive[i]=true;
    i++;
  }
  mode=INTRO;
  lives=3;
  score=0;
  music.rewind();
  end.rewind();
  loss.rewind();
}

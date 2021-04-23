void intro() {
  end.pause();
  loss.pause();
   music.play();
  imageMode(CORNER);
  background(green);
  noStroke();
  fill(blue);
  rect(0,0,800,300);
  //gif
  image(wind[f],0,30);
  if (frameCount % 3==0)f++;
  if(f==frames) f=0;
  //text
  fill(white);
  textSize(70);
  text("BREAKOUT", 395, 95);
  fill(brown);
  text("BREAKOUT", 400, 100);

  image(hayStack, 0, 345, 256, 256);
  image(hayBail, 500, 345, 256, 256);
}

void introClicks() {
  mode=GAME;
  by=450;
  bx=400;
  vx=0;
  vy=4;
  px=width/2;
}

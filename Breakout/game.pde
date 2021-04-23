void game() {
  imageMode(CENTER);
  background(clay);
  noStroke();
  //lives counter
  fill(white);
  textSize(30);
  text("LIVES: "+lives, 120, 50);

  //score
  fill(white);
  textSize(30);
  text("SCORE: "+score, 670, 50);

  //draw paddle
  circle(px, py, pd);
  image(wolf, px, py-20, pd, pd);

  // draw ball
  fill(black);
  circle(bx, by, bd);

  //move paddle
  if (timer<0) {
    if (px>pd/2+pd/6) {
      if (akey==true)px=px-9;
    }

    if (px<width-(pd/2+pd/6)) {
      if (dkey==true)px=px+9;
    }
  }
  //move ball
  if (timer<0) {
    bx=bx+vx;
    by=by+vy;
    if (vy==0)vy++;
  }

  if (by>610) {
    by=450;
    bx=400;
    vx=0;
    vy=4;
    px=width/2;
    timer=100;
    lives=lives-1;
  }

  if (bx<bd/2||bx>width-bd/2)vx=vx*-1;
  if (by<bd/2)vy=vy*-1;

  //paddle collisions
  if (dist(px, py, bx, by)<=pd/2+bd/2) {
    vx=(bx-px)/10;
    vy=(by-py)/10;
    bounce.rewind();
    bounce.play();
  }

  //timer
  timer=timer-1;

  if (lives<=0)mode=GAMEOVER;
  if (score==30)mode=GAMEOVER;

  // draw bricks

  int i=0;
  while (i<n) {
    manageBrick(i);
    i++;
  }
}


void gameClicks() {
  mode=PAUSE;
}

void manageBrick(int i) { 

  if (alive[i]==true) {
    if (y[i]==100)fill(blue);
    if (y[i]==170)fill(green);
    if (y[i]==240)fill(orange);
    if (y[i]==310)fill(yellow);
    circle(x[i], y[i], brickd);
    image(pig, x[i], y[i], brickd, brickd);
    //brick bounce
    if (dist(x[i], y[i], bx, by)<=bd/2+brickd/2) {
      vx=(bx-x[i])/5;
      vy=(by-y[i])/5;
      alive[i] =false;
      score=score+1;
      bang.rewind();
      bang.play();
    }
  }
}

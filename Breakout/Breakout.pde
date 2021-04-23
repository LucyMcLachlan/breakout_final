//lucy mclachlan
//breakout 1-4


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode variables
int mode;
final int INTRO=1;
final int GAME=2;
final int PAUSE=3;
final int GAMEOVER=4;

// color variables
color orange=#D18C5F;
color brown=#7C5421;
color yellow=#DCC73D;
color green=#ACAB64;
color clay=#B77F6E;
color white=#FFFFFF;
color black=#000000;
color blue=#C1D8F2;

//font
PFont western;

//score
int score=0;
int lives=3;
int timer=100;

//images
PImage hayBail, hayStack, pig, wolf,cow;

//gif var
PImage[] wind;
int frames=36;
int f;

//padle var
float px, py, pd;

//ball var
float bx, by, bd;
float vx, vy;

//keyboard var
boolean akey, dkey;

//brick var
int[] x; //array of x coordinates
int[] y; //array of y coordinaties
int n; // # of elements in array
int brickd; // diameter of the bricks
int tempx, tempy;
boolean[] alive;

//audio
Minim minimTools;
AudioPlayer music,end,bounce,bang,loss;

void setup() {
  size(800, 600);
  mode=INTRO;
  western=createFont("WOODCUT.TTF", 1);
  textAlign(CENTER, CENTER);
  textFont(western, 100);
  //image initialization
  
  hayBail= loadImage("hay_bail.png");
  hayStack=loadImage("hay_stack.png");
  wolf= loadImage("wolfie.png");
  pig=loadImage("piggy.png");
  cow=loadImage("cow.png");
  
  //padle initialization
  px=width/2;
  py=height;
  pd=100;
  
  // ball initialization
  by=450;
  bx=400;
  bd=15;
  
  //array setup
  n=30;
  x= new int [n];
  y= new int [n];
  alive= new boolean [n];
  brickd=50;
  tempx=50;
  tempy=100;
  int i =0;
  while (i<n) {
    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+100;
    if (tempx==850) {
      tempy=tempy+70;
      tempx=100;
    }
    if (tempx==800) {
      tempy=tempy+70;
      tempx=50;
    }
    i++;
  }
  
  //gif
  wind =new PImage[frames];

  int wi=0;
  while (wi<frames) {
    wind[wi]=loadImage("frame_" + wi +"_delay-0.01s.gif");
    wi++;
  }
  
  //audio
  minimTools=new Minim(this);
  music=minimTools.loadFile("Bama Country.mp3");
  end=minimTools.loadFile("Loping Sting.mp3");
  bounce=minimTools.loadFile("bounce.wav");
  bang=minimTools.loadFile("bang.wav");
  loss=minimTools.loadFile("loss.wav");
}

void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {
    game();
  } else if (mode== PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else println("mode error ="+ mode);
}

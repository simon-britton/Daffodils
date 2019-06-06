/* 
 Project Name: Daffodils
 Project Description: This is Simon Britton's final project for AP Computer Science A. The following program defines an animated version of Daffodils, as written by William Wordsworth.
 */

import processing.sound.*;
SoundFile scene2, scene3, scene4, scene5, scene6, scene7, scene8, scene9, scene10, scene11, scene12, scene13;

Animable[] scenes;
Animator animator;
int currScene, FRAME_RATE;
PFont body24, title;
String[] lines;

color BLACK = #000000;
color LEAF_GREEN = #3A5F0B;
color MIDNIGHT_PURPLE = #3D2A74;
color SKY_BLUE = #87CEEB;
color WHITE = #FFFFFF;

void settings() {
  size(1000, 618);
}

void setup() {
  FRAME_RATE = 45;
  frameRate(FRAME_RATE);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 0);
  imageMode(CENTER);

  title = createFont("PinyonScript-Regular.ttf", 48);
  body24 = createFont("PinyonScript-Regular.ttf", 24);
  textAlign(CENTER);
  textFont(title);

  lines = loadStrings("poem.txt");
  scenes = new Animable[31];
  animator = new Animator();
  currScene = 0;

  scene2 = new SoundFile(this, "Scene2.wav");
  scene3 = new SoundFile(this, "Scene3.wav");
  scene4 = new SoundFile(this, "Scene4.wav");
  scene5 = new SoundFile(this, "Scene5.wav");
  scene6 = new SoundFile(this, "Scene6.wav");
  scene7 = new SoundFile(this, "Scene7.wav");
  scene8 = new SoundFile(this, "Scene8.wav");
  scene9 = new SoundFile(this, "Scene9.wav");
  scene10 = new SoundFile(this, "Scene10.wav");
  scene11 = new SoundFile(this, "Scene11.wav");
  scene12 = new SoundFile(this, "Scene12.wav");
  scene13 = new SoundFile(this, "Scene13.wav");

  scenes[0] = new Transition(Transitions.FADE_IN, 1, 2, 45);
  scenes[1] = new Scene1();
  scenes[2] = new Transition(Transitions.FADE_OUT, 1, 2, 45);
  scenes[3] = new Transition(Transitions.FADE_IN, 4, 1, 45);
  scenes[4] = new Scene2();
  scenes[5] = new Transition(Transitions.SLIDE_UP, 4, 6, 1, 45);
  scenes[6] = new Scene3();
  scenes[7] = new Transition(Transitions.MERGE, 6, 8, 1, 45);
  scenes[8] = new Scene4();
  scenes[9] = new Transition(Transitions.SLIDE_DOWN, 8, 10, 1, 45);
  scenes[10] = new Scene5();
  scenes[11] = new Transition(Transitions.SLIDE_UP, 10, 12, 1, 45);
  scenes[12] = new Scene6();
  scenes[13] = new Transition(Transitions.MERGE, 12, 14, 1, 17);
  scenes[14] = new Scene7();
  scenes[15] = new Transition(Transitions.MERGE, 14, 16, 1, 17);
  scenes[16] = new Scene8();
  scenes[17] = new Transition(Transitions.FADE_OUT, 16, 0.5, 17);
  scenes[18] = new Transition(Transitions.FADE_IN, 19, 0.5, 30);
  scenes[19] = new Scene9();
  scenes[20] = new Transition(Transitions.SPLIT_HORIZONTAL, 19, 21, 1, 30);
  scenes[21] = new Scene10();
  scenes[22] = new Transition(Transitions.SPLIT_VERTICAL, 21, 23, 1, 30);
  scenes[23] = new Scene11();
  scenes[24] = new Transition(Transitions.ZOOM_IN_2, 23, 25, 1, 30);
  scenes[25] = new Scene12();
  scenes[26] = new Transition(Transitions.WIPE_UP, 25, 27, 1, 30);
  scenes[27] = new Scene13();
  scenes[28] = new Transition(Transitions.SPOTLIGHT_OUT, 27, 2, 30);
  scenes[29] = new Transition(Transitions.SPOTLIGHT_IN, 30, 2, 30);
  scenes[30] = new Scene14();
}

void draw() {
  animator.play(currScene);
}

void changeFrameRate(int FRAME_RATE) {
  this.FRAME_RATE = FRAME_RATE;
  frameRate(FRAME_RATE);
}

void keyPressed() {
  if (currScene == 30 && keyCode == 82) {
    currScene = 0;
    for (Animable scene : scenes) {
      scene.reset();
    }
  }
}

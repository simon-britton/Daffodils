/* 
 Project Name: Daffodils
 Project Description: Final Project! Woohoo!
 */

String[] lines;
Animable[] scenes;
Animator animator;
int currScene;

final color SKY_BLUE = #87CEEB;
final color DAFFODIL_YELLOW = #FFFF31;
final color LEAF_GREEN = #3A5F0B;
final color LAKE_BLUE = #0077BE;
final color SAND = #C2B280;

final int FRAME_RATE = 60;

PFont title;

void setup() {
  size(1000, 618);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 0);

  title = createFont("PinyonScript-Regular.ttf", 48);
  textAlign(CENTER);
  textFont(title);

  lines = loadStrings("poem.txt");
  scenes = new Animable[28];
  animator = new Animator();
  currScene = 0;

  scenes[1] = new Scene1();
  scenes[0] = new Transition(Transitions.SPOTLIGHT_IN, 1, 2);
  scenes[2] = new Transition(Transitions.SPOTLIGHT_OUT, 1, 2);
  scenes[3] = new Scene2();
  scenes[5] = new Scene3();
  scenes[4] = new Transition(Transitions.SPLIT_HORIZONTAL, 3, 5, 2);
  scenes[7] = new Scene4();
  scenes[6] = new Transition(Transitions.SPLIT_VERTICAL, 5, 7, 2);
  scenes[9] = new Scene5();
  scenes[8] = new Transition(Transitions.MERGE_HORIZONTAL, 7, 9, 2);
  scenes[11] = new Scene6();
  scenes[10] = new Transition(Transitions.MERGE_VERTICAL, 9, 11, 2);
  scenes[13] = new Scene7();
  scenes[12] = new Transition(Transitions.FADE_TO, 11, 13, 2);
  scenes[15] = new Scene8();
  scenes[14] = new Transition(Transitions.FADE_FROM, 13, 15, 2);
  scenes[17] = new Scene9();
  scenes[16] = new Transition(Transitions.UNCRUMPLE_LEFT, 15, 17, 2);
  scenes[19] = new Scene10();
  scenes[18] = new Transition(Transitions.UNCRUMPLE_UP, 17, 19, 2);
  scenes[21] = new Scene11();
  scenes[20] = new Transition(Transitions.UNCRUMPLE_DOWN, 19, 21, 2);
  scenes[23] = new Scene12();
  scenes[22] = new Transition(Transitions.MERGE, 21, 23, 2);
  scenes[25] = new Scene13();
  scenes[24] = new Transition(Transitions.UNCOVER_UP, 23, 25, 2);
  scenes[27] = new Scene14();
  scenes[26] = new Transition(Transitions.UNCOVER_DOWN, 25, 27, 2);
}

void draw() {
  animator.play(currScene);
}

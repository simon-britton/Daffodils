public class Scene8 extends Scene {
  private PShape wave1, wave2, wave3;
  
  public Scene8() {
    super(8.5, 7.5, 17);
    add(new AudioPlayer(getParent(), scene8, 1, 7.35));
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    wave1 = loadShape("wave1.svg");
    wave2 = loadShape("wave2.svg");
    wave3 = loadShape("wave3.svg");
    add(new Wave(wave1, -500, 0, 18));
    add(new Wave(wave2, 0, -500, 118));
    add(new Wave(wave3, -500, 0, 218));
    add(new Wave(wave1, 0, -500, 318));
    add(new Wave(wave2, -500, 0, 418));
    add(new Wave(wave3, 0, -500, 518));
    add(new AnimatedText(getParent(), 16, new State(getParent(), 1000, 205, 0, 1, 0), 8.5, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100), 
      new Animation(Scene8.this.getParent(), 0, 8.5, Animations.TRANSLATE, 500, 205)));
    add(new AnimatedText(getParent(), 17, new State(getParent(), 0, 407.5, 0, 1, 0), 3, 5.5, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100), 
      new Animation(Scene8.this.getParent(), 0, 5.5, Animations.TRANSLATE, 324, 407.5)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Wave extends AnimableObject {
    boolean right;
    PShape wave;
    
    public Wave(PShape wave, float from, float to, float ypos) {
      super(Scene8.this.getParent(), new State(Scene8.this.getParent(), from, ypos, 0, 1, 100), 8.35, 
        new Animation(Scene8.this.getParent(), 0, 8.35, Animations.TRANSLATE, to, ypos));
      this.wave = wave;
    }
    
    public void draw() {
      getParent().getGraphics().shapeMode(CORNER);
      getParent().getGraphics().shape(wave, 0, 0);
    }
  }
}

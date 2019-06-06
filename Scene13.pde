public class Scene13 extends Scene {
  PShape daffodil1 = loadShape("daffodil4.svg");
  PShape daffodil2 = loadShape("daffodil5.svg");
  
  public Scene13() {
    super(9.25, 7.25, 30);
    add(new AudioPlayer(getParent(), scene13, 1, 8.25));
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new LargeSpinner());
    add(new SmallSpinner(100, 100));
    add(new SmallSpinner(width-100, 100));
    add(new SmallSpinner(100, height-100));
    add(new SmallSpinner(width-100, height-100));
    add(new AnimatedText(getParent(), 26, new State(getParent(), width/2, height/2-25, 0, 1, 0), 1.0, 8.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 27, new State(getParent(), width/2, height/2+25, 0, 1, 0), 5.0, 4.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class LargeSpinner extends DynamicObject {
    public LargeSpinner() {
      super(Scene13.this.getParent(), new State(Scene13.this.getParent(), width/2, height/2, 0, 1, 100));
    }
    
    public void draw() {
      getParent().getGraphics().shapeMode(CENTER);
      getParent().getGraphics().shape(daffodil1, 0, 0);
    }
    
    public void update() {
      getState().incrementTheta(PI/200);
    }
  }
  
  public class SmallSpinner extends DynamicObject {
    PShape daffodil;
    
    public SmallSpinner(float xpos, float ypos) {
      super(Scene13.this.getParent(), new State(Scene13.this.getParent(), xpos, ypos, 0, 1, 100));
    }
    
    public void draw() {
      getParent().getGraphics().shapeMode(CENTER);
      getParent().getGraphics().shape(daffodil2, 0, 0);
    }
    
    public void update() {
      getState().incrementTheta(-PI/200);
    }
  }
}

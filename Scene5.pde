public class Scene5 extends Scene {
  public Scene5() {
    super(7.35, 6.35, 45);
    add(new Background(getParent(), SKY_BLUE, MIDNIGHT_PURPLE, Backgrounds.GRADIENT_UP));
    add(new AudioPlayer(getParent(), scene5, 1, 7.1));
    for (int i=0; i<100; i++) {
      add(new Star());
    }
    add(new AnimatedText(getParent(), 8, new State(getParent(), width/2, height/2-25, 0, 1, 0), 1.0, 6.35, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 9, new State(getParent(), width/2, height/2+25, 0, 1, 0), 4.0, 3.35, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24); 
    getParent().getGraphics().noStroke();
  }
  
  public class Star extends DynamicObject {
    private long count;
    
    public Star() {
      super(Scene5.this.getParent(), new State(Scene5.this.getParent()));
      getState().getRandomState(10, width/2-200, width/2+200, height/2-100, height/2+100);
      count = (int)(4*Math.random()*getParent().getFrameRate());
    }
    
    public void draw() {
      if (count/getParent().getFrameRate() % 4 == 0) {
        getParent().getGraphics().fill(WHITE, getState().getAlpha());
        getParent().getGraphics().ellipse(0, 0, 5, 5);
      }
    }
    
    public void reset() {
      count = (int)(4*Math.random()*getParent().getFrameRate());
      super.reset();
      getState().getRandomState(10, width/2-200, width/2+200, height/2-100, height/2+100);
    }
    
    public void update() {
      count++;
    }
  }
}

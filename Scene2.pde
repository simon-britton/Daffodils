public class Scene2 extends Scene {
  public Scene2() {
    super(8.45, 7.45, 45);
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new AudioPlayer(getParent(), scene2, 1, 7.45));
    add(new Cloud1());
    add(new Cloud2());
  }
  
  public void settings() {
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().noStroke();
  }
  
  public class Cloud1 extends AnimableObject {
    PImage image;
    
    public Cloud1() {
      super(Scene2.this.getParent(), new State(Scene2.this.getParent(), -200, 150, 0, 1, 100), 8.45);
      add(new StaticText(getParent(), 1, 0, 20, BLACK));
      image = loadImage("cloud.png");
      image.resize(400, 200);
    }
    
    public void update() {
      getState().incrementX(3);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CENTER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
  
  public class Cloud2 extends AnimableObject {
    private PImage image;
    
    public Cloud2() {
      super(Scene2.this.getParent(), new State(Scene2.this.getParent(), 1200, 468, 0, 1, 100), 3.0, 5.45);
      add(new StaticText(getParent(), 2, 0, 30, BLACK));
      image = loadImage("cloud.png");
      image.resize(400, 200);
    }
    
    public void update() {
      getState().incrementX(-3);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CENTER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
}

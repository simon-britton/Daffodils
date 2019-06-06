public class Scene12 extends Scene {
  public Scene12() {
    super(8.25, 7.25, 30);
    add(new AudioPlayer(getParent(), scene12, 1, 7.75));
    add(new Background(getParent(), BLACK, Backgrounds.RECTANGLE));
    add(new Eye());
    add(new AnimatedText(getParent(), 24, new State(getParent(), width/2, height/2-25, 0, 1, 0), 1.0, 7.25, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 25, new State(getParent(), width/2, height/2+25, 0, 1, 0), 4.0, 4.25, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Eye extends ScreenObject {
    private PImage image;
    
    public Eye() {
      super(Scene12.this.getParent());
      image = loadImage("eye.jpg");
      image.resize(1000, 618);
    }
    
    public void draw() {
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
}

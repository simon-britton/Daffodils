public class Scene9 extends Scene {
  public Scene9() {
    super(7.35, 6.35, 30);
    add(new AudioPlayer(getParent(), scene9, 1, 6.1));
    add(new Background(getParent(), BLACK, Backgrounds.RECTANGLE));
    add(new Poet());
    add(new AnimatedText(getParent(), 18, new State(getParent(), width/2, 37.5, 0, 1, 0), 0.5, 6.85, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 19, new State(getParent(), width/2, 593, 0, 1, 0), 4, 3.35, WHITE, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Poet extends ScreenObject {
    private PImage image;
    
    public Poet() {
      super(Scene9.this.getParent());
      image = loadImage("william-wordsworth.jpg");
      image.resize(600, 500);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CENTER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, width/2, height/2);
    }
  }
}

public class Scene4 extends Scene {
  public Scene4() {
    super(8.25, 7.25, 45);
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new AudioPlayer(getParent(), scene4, 1, 7.75));
    add(new Lake());
    add(new AnimatedText(getParent(), 5, new State(getParent(), 800, 518, 0, 1, 0), 1.0, 7.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 6, new State(getParent(), 200, 568, 0, 1, 0), 2.35, 5.9, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 7, new State(getParent(), width/2-100, height/2-100, 0, 1, 0), 4.0, 4.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100), 
      new Animation(getParent(), 0, 5, Animations.TRANSLATE, width/2+100, height/2-100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Lake extends ScreenObject {
    private PImage image;
    
    public Lake() {
      super(Scene4.this.getParent());
      image = loadImage("lake.png");
      image.resize(1000, 312);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 306);
    }
  }
}

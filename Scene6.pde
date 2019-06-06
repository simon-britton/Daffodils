public class Scene6 extends Scene {
  public Scene6() {
    super(8.25, 7.25, 45);
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new AudioPlayer(getParent(), scene6, 1, 7.75));
    add(new AnimatedText(getParent(), 10, new State(getParent(), width/2-137.5, height/2-125, 0, 1, 0), 1.0, 7.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 11, new State(getParent(), width/2-70, height/2-125, 0, 1, 0), 1.0, 7.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100), 
      new Animation(getParent(), 0.5, 0.5, Animations.STRETCH_Y, 2), 
      new Animation(getParent(), 1, 0.5, Animations.STRETCH_Y, 1)));
    add(new AnimatedText(getParent(), 12, new State(getParent(), width/2+62.5, height/2-125, 0, 1, 0), 1.0, 7.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 13, new State(getParent(), width/2, height/2-75, 0, 1, 0), 4.0, 4.25, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new Bay());
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Bay extends ScreenObject {
    private PImage image;
    
    public Bay() {
      super(Scene6.this.getParent());
      image = loadImage("bay.png");
      image.resize(1000, 394);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 224);
    }
  }
}

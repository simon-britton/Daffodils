public class Scene11 extends Scene {
  public Scene11() {
    super(8.5, 7.5, 30);
    add(new AudioPlayer(getParent(), scene11, 1, 7.5));
    add(new Background(getParent(), BLACK, Backgrounds.RECTANGLE));
    add(new Room());
    add(new AnimatedText(getParent(), 22, new State(getParent(), width/2, height/2-50, 0, 1, 0), 1.0, 7.5, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 23, new State(getParent(), width/2, height/2, 0, 1, 0), 5.0, 3.5, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Room extends ScreenObject {
    private PImage image;
    
    public Room() {
      super(Scene11.this.getParent());
      image = loadImage("room.jpg");
      image.resize(1000, 618);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
}

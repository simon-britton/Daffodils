public class Scene3 extends Scene {
  private PImage daffodil;
  
  public Scene3() {
    super(7.15, 6.15, 45);
    daffodil = loadImage("daffodil1.png");
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new AudioPlayer(getParent(), scene3, 1, 6.15));
    add(new AnimatedText(getParent(), 3, new State(getParent(), width/2, height/2-100, 0, 1, 0), 1.0, 6.15, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 4, new State(getParent(), width/2, height/2-50, 0, 1, 0), 3.75, 3.4, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new Ground());
    add(new Daffodil());
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Ground extends ScreenObject {
    private PImage image;
    
    public Ground() {
      super(Scene3.this.getParent());
      image = loadImage("ground.png");
      image.resize(1000, 420);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 198);
    }
  }
  
  public class Daffodil extends ScreenObject {
    public Daffodil() {
      super(Scene3.this.getParent());
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      for (int i=0; i<5; i++) {
        if (i%2 == 0) {
          getParent().getGraphics().image(daffodil, (float)115/6+i*(177+(float)115/6), 368);
        } else {
          getParent().getGraphics().image(daffodil, (float)115/6+i*(177+(float)115/6), 318);
        }
      }
    }
  }
}

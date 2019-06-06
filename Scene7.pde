public class Scene7 extends Scene {
  private PImage daffodil;
  
  public Scene7() {
    super(8, 7, 17);
    daffodil = loadImage("daffodil2.png");
    add(new AudioPlayer(getParent(), scene7, 1, 7));
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new Ground());
    add(new AnimatedText(getParent(), 14, new State(getParent(), width/2, height/2-200, 0, 1, 0), 1, 7, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 15, new State(getParent(), width/2, height/2-150, 0, 1, 0), 4, 4, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new DancingDaffodil(width/2-450, height/2+100));
    add(new DancingDaffodil(width/2-400, height/2+150));
    add(new DancingDaffodil(width/2-350, height/2+200));
    add(new DancingDaffodil(width/2-300, height/2+125));
    add(new DancingDaffodil(width/2-250, height/2+50));
    add(new DancingDaffodil(width/2-200, height/2+125));
    add(new DancingDaffodil(width/2-150, height/2+225));
    add(new DancingDaffodil(width/2-100, height/2+75));
    add(new DancingDaffodil(width/2-50, height/2+275));
    add(new DancingDaffodil(width/2, height/2+150));
    add(new DancingDaffodil(width/2+50, height/2+225));
    add(new DancingDaffodil(width/2+100, height/2+100));
    add(new DancingDaffodil(width/2+150, height/2+250));
    add(new DancingDaffodil(width/2+200, height/2+275));
    add(new DancingDaffodil(width/2+250, height/2+175));
    add(new DancingDaffodil(width/2+300, height/2+225));
    add(new DancingDaffodil(width/2+350, height/2+200));
    add(new DancingDaffodil(width/2+400, height/2+100));
    add(new DancingDaffodil(width/2+450, height/2+125));
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
      super(Scene7.this.getParent());
      image = loadImage("ground2.png");
      image.resize(1000, 420);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 229);
    }
  }
  
  public class DancingDaffodil extends DynamicObject {
    private long count;
    private boolean right;
    
    public DancingDaffodil(float x, float y) {
      super(Scene7.this.getParent(), new State(Scene7.this.getParent(), x, y, (float)Math.random()*2*PI/15-PI/15, 1, 100));
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CENTER);
      getParent().getGraphics().image(daffodil, 0, -50);
    }
    
    public void update() {
      if (right) {
        getState().incrementTheta(PI/800);
        if (getState().getTheta() > PI/15) {
          right = false;
        }
      } else {
        getState().incrementTheta(-PI/800);
        if (getState().getTheta() < -PI/15) {
          right = true;
        }
      }
      count++;
    }
  }
}

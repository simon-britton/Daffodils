public class Scene10 extends Scene {
  public Scene10() {
    super(8.75, 7.75, 30);
    add(new AudioPlayer(getParent(), scene10, 1, 7.75));
    add(new Background(getParent(), WHITE, Backgrounds.RECTANGLE));
    add(new Coins1());
    add(new Coins2());
    add(new Coins3());
    add(new Coins4());
    add(new Coins5());
    add(new AnimatedText(getParent(), 20, new State(getParent(), width/2, 100, 0, 1, 0), 1.0, 7.75, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
    add(new AnimatedText(getParent(), 21, new State(getParent(), width/2, 518, 0, 1, 0), 5.0, 3.75, BLACK, 
      new Animation(getParent(), 0, 2, Animations.FADE, 100)));
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(body24);
    getParent().getGraphics().noStroke();
  }
  
  public class Coins1 extends AnimableObject {
    private PImage image;
    
    public Coins1() {
      super(Scene10.this.getParent(), new State(Scene10.this.getParent(), width/2-249, height/2-173, 0, 1, 0), 9, 
        new Animation(Scene10.this.getParent(), 0, 2, Animations.FADE, 100));
      this.image = loadImage("coins1.jpg");
      image.resize(0, 346);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
  
  public class Coins2 extends AnimableObject {
    private PImage image;
    
    public Coins2() {
      super(Scene10.this.getParent(), new State(Scene10.this.getParent(), width/2-249, height/2-173, 0, 1, 0), 1.6, 7.4, 
        new Animation(Scene10.this.getParent(), 0, 2, Animations.FADE, 100));
      this.image = loadImage("coins2.jpg");
      image.resize(0, 346);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
  
  public class Coins3 extends AnimableObject {
    private PImage image;
    
    public Coins3() {
      super(Scene10.this.getParent(), new State(Scene10.this.getParent(), width/2-249, height/2-173, 0, 1, 0), 3.2, 5.8, 
        new Animation(Scene10.this.getParent(), 0, 2, Animations.FADE, 100));
      this.image = loadImage("coins3.jpg");
      image.resize(0, 346);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
  
  public class Coins4 extends AnimableObject {
    private PImage image;
    
    public Coins4() {
      super(Scene10.this.getParent(), new State(Scene10.this.getParent(), width/2-249, height/2-173, 0, 1, 0), 4.8, 4.2, 
        new Animation(Scene10.this.getParent(), 0, 2, Animations.FADE, 100));
      this.image = loadImage("coins4.jpg");
      image.resize(0, 346);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
  
  public class Coins5 extends AnimableObject {
    private PImage image;
    
    public Coins5() {
      super(Scene10.this.getParent(), new State(Scene10.this.getParent(), width/2-249, height/2-173, 0, 1, 0), 6.4, 2.6, 
        new Animation(Scene10.this.getParent(), 0, 2, Animations.FADE, 100));
      this.image = loadImage("coins5.jpg");
      image.resize(0, 346);
    }
    
    public void draw() {
      getParent().getGraphics().imageMode(CORNER);
      getParent().getGraphics().tint(#FFFFFF, getState().getAlpha());
      getParent().getGraphics().image(image, 0, 0);
    }
  }
}

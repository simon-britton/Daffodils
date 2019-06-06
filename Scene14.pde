public class Scene14 extends Scene {
  public Scene14() {
    super(0, 30);
    add(new Background(getParent(), LEAF_GREEN, Backgrounds.RECTANGLE));
    add(new RainbowText());
  }
  
  public boolean isFinished() {
    return false;
  }
  
  public void iterate() {
    getParent().getGraphics().beginDraw();
    settings();
    getParent().getGraphics().pushMatrix();
    getState().applyState();
    iterateChildren();
    getParent().getGraphics().popMatrix();
    getParent().getGraphics().endDraw();
    image(getParent().getGraphics(), width/2, height/2);
  }
  
  public void iterateWithoutDrawing() {
    getParent().getGraphics().beginDraw();
    settings();
    getParent().getGraphics().pushMatrix();
    getState().applyState();
    iterateChildren();
    getParent().getGraphics().popMatrix();
    getParent().getGraphics().endDraw();
  }
  
  public void settings() {
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(title);
    getParent().getGraphics().noStroke();
  }
  
  public boolean started() {
    return true;
  }
  
  public class RainbowText extends DynamicObject {
    private int count;
    public RainbowText() {
      super(Scene14.this.getParent(), new State(Scene14.this.getParent(), width/2, height/2, 0, 1, 100));
      count = 0;
    }
    public void draw() {
      getParent().getGraphics().fill(count%360, 100, 100);
      getParent().getGraphics().text("Press \'R\' to restart", 0, 0);
    }
    public void update() {
      count++;
      if (count >= 360) {
        count = 0;
      }
    }
    public void reset() {
      count = 0;
      super.reset();
    }
  }
}

public abstract class Scene extends AnimableObject {
  private int originalTrigger, trigger;
  
  public Scene(State state, float duration, float trigger, int FRAME_RATE) {
    super(new Canvas(FRAME_RATE), state, duration);
    this.trigger = (int)(FRAME_RATE*trigger);
    originalTrigger = this.trigger;
  }
  
  public Scene(float duration, int FRAME_RATE) {
    super(new Canvas(FRAME_RATE), duration);
    this.trigger = (int)(FRAME_RATE*duration);
    originalTrigger = this.trigger;
  }
  
  public Scene(float duration, float trigger, int FRAME_RATE) {
    super(new Canvas(FRAME_RATE), duration);
    this.trigger = (int)(FRAME_RATE*trigger);
    originalTrigger = this.trigger;
  }
  
  public void init() {
    changeFrameRate(getParent().getFrameRate());
  }
  
  public void iterate() {
    getParent().getGraphics().beginDraw();
    settings();
    super.iterate();
    getParent().getGraphics().endDraw();
    image(getParent().getGraphics(), width/2, height/2);
    if (trigger>0) {
      trigger--;
    } else if (trigger == 0) {
      trigger = -1;
      animator.nextScene();
    }
  }
  
  public void iterateWithoutDrawing() {
    getParent().getGraphics().beginDraw();
    settings();
    super.iterate();
    getParent().getGraphics().endDraw();
    if (trigger>0) {
      trigger--;
    } else if (trigger == 0) {
      trigger = -1;
      animator.nextScene();
    }
  }
  
  public void reset() {
    trigger = originalTrigger;
    getParent().getGraphics().beginDraw();
    getParent().getGraphics().clear();
    getParent().getGraphics().endDraw();
    super.reset();
  }
  
  public void settings() {
  }
  
  public void snapshot() {
    image(getParent().getGraphics(), width/2, height/2);
  }
  
  public void snapshot(float a) {
    tint(#FFFFFF, a);
    image(getParent().getGraphics(), width/2, height/2);
  }
}

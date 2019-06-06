public abstract class DynamicObject extends ScreenObject {
  private boolean isInit;
  
  public DynamicObject(Canvas parent) {
    super(parent);
    isInit = false;
  }
  
  public DynamicObject(Canvas parent, State state) {
    super(parent, state);
    isInit = false;
  }
  
  public void init() {
  }
  
  public void iterate() {
    if (!isInit) {
      init();
      isInit = true;
    }
    getParent().getGraphics().pushMatrix();
    update();
    getState().applyState();
    draw(); 
    iterateChildren();
    getParent().getGraphics().popMatrix();
  }
  
  public void reset() {
    isInit = false;
    super.reset();
  }
  
  public void update(){
  }
}

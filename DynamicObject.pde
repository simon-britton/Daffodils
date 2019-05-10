public abstract class DynamicObject extends ScreenObject {
  public DynamicObject() {
    super();
  }
  public DynamicObject(State state) {
    super(state);
  }
  public DynamicObject(ArrayList<ScreenObject> components) {
    super(components);
  }
  public DynamicObject(State state, ArrayList<ScreenObject> components) {
    super(state, components);
  }
  public abstract void update();
  public void iterate() {
    pushMatrix();
    update();
    super.getState().applyState();
    draw(); 
    super.iterateChildren();
    popMatrix();
  }
}

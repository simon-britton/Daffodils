public abstract class ScreenObject {
  private ArrayList<ScreenObject> components;
  private State state;
  private Canvas parent;
  
  public ScreenObject(Canvas parent) {
    this.parent = parent;
    state = new State(parent, 0, 0, 0, 1, 100);
  }
  
  public ScreenObject(Canvas parent, State state) {
    this.parent = parent;
    this.state = state;
  }
  
  public void add(ScreenObject s) {
    if (components == null) {
      components = new ArrayList<ScreenObject>();
    }
    components.add(s);
  }
  
  public void draw() {
  }
  
  public ArrayList<ScreenObject> getComponents() {
    return components;
  }
  
  public Canvas getParent() {
    return parent;
  }
  
  public State getState() {
    return state;
  }
  
  public void iterate() {
    parent.getGraphics().pushMatrix();
    state.applyState();
    draw();
    iterateChildren();
    parent.getGraphics().popMatrix();
  }
  
  public void iterateChildren() {
    if (components != null) {
      for (ScreenObject s : components) {
        s.iterate();
      }
    }
  }
  
  public void reset() {
    state.reset();
    if(components != null) {
      for(ScreenObject component : components) {
        component.reset();
      }
    }
  }
}

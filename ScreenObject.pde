public abstract class ScreenObject {
  private ArrayList<ScreenObject> components;
  private State state;
  public ScreenObject() {
    state = new State(0, 0, 0, 1);
  }
  public ScreenObject(State state) {
    this.state = state;
  }
  public ScreenObject(ArrayList<ScreenObject> components) {
    state = new State(0, 0, 0, 1);
    this.components = components;
  }
  public ScreenObject(State state, ArrayList<ScreenObject> components) {
    this.state = state;
    this.components = components;
  }
  public abstract void draw();
  public abstract void draw(float alpha);
  public void snapshot() {
    pushMatrix();
    state.applyState();
    draw();
    if (components != null) {
      for (ScreenObject s : components) {
        if (s != null) {
          s.snapshot();
        }
      }
    }
    popMatrix();
  }
  public void snapshot(float alpha) {
    pushMatrix();
    state.applyState();
    draw(alpha);
    if (components != null) {
      for (ScreenObject s : components) {
        if (s != null) {
          s.snapshot(alpha);
        }
      }
    }
    popMatrix();
  }
  public void iterate() {
    pushMatrix();
    state.applyState();
    draw(); 
    iterateChildren();
    popMatrix();
  }
  public void iterateChildren() {
    if (components != null) {
      for (ScreenObject s : components) {
        if (s != null) {
          s.iterate();
        }
      }
    }
  }
  public ArrayList<ScreenObject> getComponents() {
    return components;
  }
  public State getState() {
    return state;
  }
}

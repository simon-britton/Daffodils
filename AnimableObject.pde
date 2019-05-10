public abstract class AnimableObject extends DynamicObject implements Animable {
  private int start, duration;
  public AnimableObject(int duration) {
    super();
    this.duration = duration;
  }
  public AnimableObject(int start, int duration) {
    super();
    this.start = start;
    this.duration = duration;
  }
  public AnimableObject(int duration, ArrayList<ScreenObject> components) {
    super(components);
    this.duration = FRAME_RATE*duration;
  }
  public AnimableObject(State state, int duration) {
    super(state);
    this.duration = duration;
  }
  public AnimableObject(State state, int duration, ArrayList<ScreenObject> components) {
    super(state, components);
    this.duration = FRAME_RATE*duration;
  }
  public AnimableObject(int start, int duration, ArrayList<ScreenObject> components) {
    super(components);
    this.duration = duration;
    this.start = FRAME_RATE*start;
  }
  public AnimableObject(State state, int start, int duration) {
    super(state);
    this.start = start;
    this.duration = duration;
  }
  public AnimableObject(State state, int start, int duration, ArrayList<ScreenObject> components) {
    super(state, components);
    this.duration = FRAME_RATE*duration;
    this.start = FRAME_RATE*start;
  }
  public boolean isFinished() {
    return duration == -1;
  }
  public boolean started() {
    return start == -1;
  }
  public void decrementFramesRemaining() {
    if (start >= 0) {
      start--;
    } else {
      duration--;
    }
    if (!(super.getComponents() == null)) {
      for (ScreenObject s : super.getComponents()) {
        if (s instanceof AnimableObject) {
          ((AnimableObject)s).decrementFramesRemaining();
        }
      }
    }
  }
}

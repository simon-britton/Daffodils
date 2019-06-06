public abstract class AnimableObject extends DynamicObject implements Animable {
  private int duration, originalDuration, originalStart, start;

  public AnimableObject(Canvas parent, float duration, Animation ... animations) {
    super(parent);
    this.duration = (int)(getParent().getFrameRate()*duration);
    originalDuration = this.duration;
    addAllAnimations(animations);
  }

  public AnimableObject(Canvas parent, float start, float duration, Animation ... animations) {
    super(parent);
    this.start = (int)(getParent().getFrameRate()*start);
    originalStart = this.start;
    this.duration = (int)(getParent().getFrameRate()*duration);
    originalDuration = this.duration;
    addAllAnimations(animations);
  }

  public AnimableObject(Canvas parent, State state, float duration, Animation ... animations) {
    super(parent, state);
    this.duration = (int)(getParent().getFrameRate()*duration);
    originalDuration = this.duration;
    start = 0;
    originalStart = this.start;
    addAllAnimations(animations);
  }

  public AnimableObject(Canvas parent, State state, float start, float duration, Animation ... animations) {
    super(parent, state);
    this.start = (int)(getParent().getFrameRate()*start);
    originalStart = this.start;
    this.duration = (int)(getParent().getFrameRate()*duration);
    originalDuration = this.duration;
    addAllAnimations(animations);
  }
  
  public void addAllAnimations(Animation[] animations) {
    if (!(animations == null)) {
      for (Animation animation : animations) {
        animation.setParent(this);
        add(animation);
      }
    }
  }
  
  public int getDuration() {
    return duration;
  }
  
  public int getOriginalDuration() {
    return originalDuration;
  }

  public boolean isFinished() {
    return duration == 0;
  }
  
  public void iterate() {
    if (start > 0) {
      start--;
    } else if (duration > 0) {
      super.iterate();
      duration--;
    }
  }
  
  public void reset() {
    duration = originalDuration;
    start = originalStart;
    super.reset();
  }

  public boolean started() {
    return start == 0;
  }
}

public class Animation extends AnimableObject {
  AnimableObject parent;
  Animations animation;
  float[] args;
  State originalState, parentState;

  public Animation(Canvas canvas, float start, float duration, Animations animation, float ... args) {
    super(canvas, start, duration);
    this.animation = animation;
    this.args = args;
  }

  public void init() {
    originalState = parent.getState().copy();
  }

  public void setParent(AnimableObject a) {
    this.parent = a;
    parentState = a.getState();
  }

  public void update() {
    switch(animation) {
    case FADE:
      parentState.incrementAlpha((args[0]-originalState.getAlpha())/getOriginalDuration());
      break;
    case ROTATE:
      parentState.incrementTheta((args[0]-originalState.getTheta())/getOriginalDuration());
      break;
    case SCALE:
      parentState.incrementScale((args[0]-originalState.getScale())/getOriginalDuration());
      break;
    case STRETCH_X:
      parentState.incrementScaleX((args[0]-originalState.getScaleX())/getOriginalDuration());
      break;
    case STRETCH_Y:
      parentState.incrementScaleY((args[0]-originalState.getScaleY())/getOriginalDuration());
      break;
    case TRANSLATE:
      parentState.incrementX((args[0]-originalState.getX())/getOriginalDuration());
      parentState.incrementY((args[1]-originalState.getY())/getOriginalDuration());
      break;
    default:
      println("Error! Error!");
      break;
    }
  }
}

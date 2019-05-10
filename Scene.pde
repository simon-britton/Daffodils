public abstract class Scene extends AnimableObject {
  public Scene(State state, int duration, ArrayList<ScreenObject> components) {
    super(state, duration, components);
  }
  public Scene(int duration, ArrayList<ScreenObject> components) {
    super(duration, components);
  }
}

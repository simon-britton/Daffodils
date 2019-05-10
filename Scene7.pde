public class Scene7 extends Scene {
  public Scene7() {
    super(5, new ArrayList<ScreenObject> () {
      {
        add(new AnimatedText(width/2, height/2, 17, 19, 5));
      }
    }
    );
  }
  public void update() {
  }
  public void draw() {
    fill(LEAF_GREEN);
    rect(0, 0, width, height);
  }
  public void draw(float alpha) {
    fill(LEAF_GREEN, alpha);
    rect(0, 0, width, height);
  }
}

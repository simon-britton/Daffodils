public class Scene6 extends Scene {
  public Scene6() {
    super(5, new ArrayList<ScreenObject> () {
      {
        add(new AnimatedText(width/2, height/2, 14, 16, 5));
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

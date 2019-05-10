public class AnimatedText extends AnimableObject {
  private String text;
  private color fill;
  public AnimatedText(State state, int startLineNumber, int endLineNumber, int duration) {
    super(state, duration);
    text = "";
    for (int i = startLineNumber; i <= endLineNumber; i++) {
      text += lines[i]+"\n";
    }
  }
  public AnimatedText(int x, int y, int startLineNumber, int endLineNumber, int duration) {
    super(new State(x, y, 0, 1), duration);
    text = "";
    for (int i = startLineNumber; i <= endLineNumber; i++) {
      text += lines[i]+"\n";
    }
  }
  public AnimatedText(State state, String text, int duration) {
    super(state, duration);
    this.text = text;
  }
  public AnimatedText(int x, int y, String text, int duration) {
    super(new State(x, y, 0, 1), duration);
    this.text = text;
  }
  public void update() {
  }
  public void draw() {
    fill(0, 0, 100);
    text(text, 0, 0);
  }
  public void draw(float alpha) {
    fill(0, 0, 100, alpha);
    text(text, 0, 0);
  }
}

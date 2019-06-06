public class StaticText extends ScreenObject {
  private color fill;
  private String text;
  
  public StaticText(Canvas parent, int lineNumber, State state, color fill) {
    super(parent, state);
    text = lines[lineNumber];
    this.fill = fill;
  }
  
  public StaticText(Canvas parent, int lineNumber, int x, int y, color fill) {
    super(parent, new State(parent, x, y, 0, 1, 100));
    text = lines[lineNumber];
    this.fill = fill;
  }
  
  public void draw() {
    getParent().getGraphics().fill(fill);
    getParent().getGraphics().text(text, 0, 0);
  }
}

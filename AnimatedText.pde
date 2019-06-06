public class AnimatedText extends AnimableObject {
  private color fill;
  private String text;
  
  public AnimatedText(Canvas parent, int startLineNumber, int endLineNumber, State state, float duration, color fill, Animation ... animations) {
    super(parent, state, duration);
    text = "";
    for (int i = startLineNumber; i <= endLineNumber; i++) {
      text += lines[i]+"\n";
    }
    this.fill = fill;
    addAllAnimations(animations);
  }
  
  public AnimatedText(Canvas parent, int startLineNumber, int endLineNumber, State state, float start, float duration, color fill, Animation ... animations) {
    super(parent, state, start, duration);
    text = "";
    for (int i = startLineNumber; i <= endLineNumber; i++) {
      text += lines[i]+"\n";
    }
    this.fill = fill;
    addAllAnimations(animations);
  }
  
  public AnimatedText(Canvas parent, int lineNumber, State state, float duration, color fill, Animation ... animations) {
    super(parent, state, duration);
    text = lines[lineNumber];
    this.fill = fill;
    addAllAnimations(animations);
  }
  
  public AnimatedText(Canvas parent, int lineNumber, State state, float start, float duration, color fill, Animation ... animations) {
    super(parent, state, start, duration);
    text = lines[lineNumber];
    this.fill = fill;
    addAllAnimations(animations);
  }
  
  public void draw() {
    getParent().getGraphics().fill(fill, getState().getAlpha());
    getParent().getGraphics().text(text, 0, 0);
  }
}

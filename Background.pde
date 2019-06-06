public class Background extends ScreenObject {
  private color c, d;
  private Backgrounds b;
  private int STEP = 5;

  public Background(Canvas parent, Backgrounds b) {
    super(parent);
    this.b = b;
    c = #000000;
  }

  public Background(Canvas parent, color c, Backgrounds b) {
    super(parent);
    this.b = b;
    this.c = c;
    this.d = #000000;
  }

  public Background(Canvas parent, color c, color d, Backgrounds b) {
    super(parent);
    this.b = b;
    this.c = c;
    this.d = d;
  }

  public void draw() {
    getParent().getGraphics().background(0, 0, 0, 0);
    switch(b) {
    case GRADIENT_DOWN:
      for (int i=0; i<height; i++) {
        getParent().getGraphics().stroke(lerpColor(c, d, (float)i/height), getState().getAlpha());
        getParent().getGraphics().line(0, i, width, i);
      }
      break;
    case GRADIENT_LEFT:
      for (int i=0; i<width; i++) {
        getParent().getGraphics().stroke(lerpColor(c, d, (float)i/width), getState().getAlpha());
        getParent().getGraphics().line(i, 0, i, height);
      }
      break;
    case GRADIENT_RIGHT:
      for (int i=0; i<width; i++) {
        getParent().getGraphics().stroke(lerpColor(c, d, (float)i/width), getState().getAlpha());
        getParent().getGraphics().line(width-i-1, 0, width-i-1, height);
      }
      break;
    case GRADIENT_UP:
      for (int i=0; i<height; i+=STEP) {
        getParent().getGraphics().rectMode(CORNERS);
        getParent().getGraphics().fill(lerpColor(c, d, (float)i/height), getState().getAlpha());
        getParent().getGraphics().rect(0, height-i-1, width, height-i-1+STEP);
      }
      break;
    case RECTANGLE:
      getParent().getGraphics().rectMode(CORNERS);
      getParent().getGraphics().fill(c, getState().getAlpha());
      getParent().getGraphics().rect(0, 0, width, height);
      break;
    }
  }
}

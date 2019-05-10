public class Background extends ScreenObject {
  private color c;
  public Background() {
    super();
    c = #000000;
  }
  public Background(color c) {
    super();
    this.c = c;
  }
  public void draw() {
    fill(c);
    rect(0, 0, width, height);
  }
  public void draw(float a) {
  }
}

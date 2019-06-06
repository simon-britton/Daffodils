public class Canvas {
  private int FRAME_RATE;
  private PGraphics canvas;
  
  public Canvas(int FRAME_RATE) {
    this.FRAME_RATE = FRAME_RATE;
    canvas = createGraphics(width, height);
  }
  
  public int getFrameRate() {
    return FRAME_RATE;
  }
  
  public PGraphics getGraphics() {
    return canvas;
  }
}

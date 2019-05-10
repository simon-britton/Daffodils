public class Animator {
  private color[] lastPixels;
  public Animator() {
    lastPixels = new color[width*height];
  }
  public void play(int num) {
    if (num > scenes.length-1) {
      return;
    }
    Animable scene = scenes[num];
    scene.decrementFramesRemaining();
    if (scene.started() && !scene.isFinished()) {
      scene.iterate();
    } else if (scene.isFinished() && num < scenes.length-1) {
      loadPixels();
      arrayCopy(pixels, lastPixels);
      currScene++;
    }
  }
  public color[] getLastPixels() {
    return lastPixels;
  }
}

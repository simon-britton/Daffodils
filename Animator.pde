public class Animator {
  private color[] lastPixels;
  
  public Animator() {
    lastPixels = new color[width*height];
  }
  
  public color[] getPixels() {
    return null;
  }
  
  public void nextScene() {
    currScene++;
  }
  
  public void play(int num) {
    if (num > scenes.length-1) {
      return;
    }
    Animable scene = scenes[num];
    if (!scene.isFinished()) {
      scene.iterate();
    } else if (scene.isFinished() && num < scenes.length-1) {
      nextScene();
    }
  }
}

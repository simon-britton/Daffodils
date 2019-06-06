public class Scene1 extends Scene {
  public Scene1() {
    super(6, 5, 45);
    add(new Background(getParent(), SKY_BLUE, Backgrounds.RECTANGLE));
    add(new StaticText(getParent(), 0, new State(getParent(), width/2, height/2, 0, 1, 100), WHITE));
  }
  
  public void settings() {
    getParent().getGraphics().imageMode(CENTER);
    getParent().getGraphics().textAlign(CENTER);
    getParent().getGraphics().textFont(title);
    getParent().getGraphics().colorMode(HSB, 360, 100, 100, 100);
    getParent().getGraphics().fill(LEAF_GREEN, getState().getAlpha());
    getParent().getGraphics().noStroke();
  }
}

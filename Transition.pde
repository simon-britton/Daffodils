public class Transition implements Animable {
  private int framesRemaining, duration, from, to;
  private Scene scene1, scene2;
  private Transitions transition;
  private Canvas parent;
  private boolean isInit;

  public Transition(Transitions transition, int from, float duration, int FRAME_RATE) {
    parent = new Canvas(FRAME_RATE);
    this.transition = transition;
    this.from = from;
    this.duration = (int)(parent.getFrameRate()*duration);
    this.framesRemaining = this.duration;
    isInit = false;
  } 

  public Transition(Transitions transition, int from, int to, float duration, int FRAME_RATE) {
    parent = new Canvas(FRAME_RATE);
    this.transition = transition;
    this.from = from;
    this.to = to;
    this.duration = (int)(parent.getFrameRate()*duration);
    this.framesRemaining = this.duration;
    isInit = false;
  } 

  public boolean isFinished() {
    return framesRemaining == -1;
  }

  public boolean started() {
    return true;
  }

  public void init() {
    this.scene1 = (Scene)scenes[from];
    if (!(to == 0)) {
      this.scene2 = (Scene)scenes[to];
    }
    isInit = true;
  }

  public float percentDone() {
    return 1-(float)framesRemaining/duration;
  }

  public float percentRemaining() {
    return (float)framesRemaining/duration;
  }

  public void iterate() {
    if (!isInit) {
      init();
    }
    if (framesRemaining >= 0) {
      switch(transition) {
      case FADE_IN: 
        scene1.snapshot();
        fill(0, 0, 0, 100*percentRemaining());
        rect(0, 0, width, height);
        break;
      case FADE_OUT: 
        scene1.snapshot();
        fill(0, 0, 0, 100*percentDone());
        rect(0, 0, width, height);
        break;
      case MERGE: 
        scene1.snapshot(100*percentRemaining());
        scene2.snapshot(100*percentDone());
        break;
      case NONE:
        break;
      case SLIDE_DOWN: 
        scene1.getState().setY(height-height*framesRemaining/duration);
        scene1.snapshot();
        scene2.getState().setY(-height*framesRemaining/duration);
        scene2.snapshot();
        break;
      case SLIDE_LEFT: 
        scene1.getState().setX(-width+width*framesRemaining/duration);
        scene1.snapshot();
        scene2.getState().setX(width*framesRemaining/duration);
        scene2.snapshot();
        break;
      case SLIDE_RIGHT: 
        scene1.getState().setX(width-width*framesRemaining/duration);
        scene1.snapshot();
        scene2.getState().setX(-width*framesRemaining/duration);
        scene2.snapshot();
        break;
      case SLIDE_UP: 
        scene1.getState().setY(-height+height*framesRemaining/duration);
        scene1.snapshot();
        scene2.getState().setY(height*framesRemaining/(int)duration);
        scene2.snapshot();
        break;
      case SPLIT_HORIZONTAL:
        int cols = (int)(percentRemaining()*width/2);
        scene2.snapshot();
        scene1.getParent().getGraphics().loadPixels();
        color[] copy1 = new color[width*height];
        arrayCopy(scene1.getParent().getGraphics().pixels, copy1);
        for (int i=0; i<=cols; i++) {
          for (int j=0; j<height; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = copy1[width*j+width/2-cols+i];
            scene1.getParent().getGraphics().pixels[width*j+width-i-1] = copy1[width*j+width/2+cols-i-1];
          }
        }
        for (int i=cols; i<width-cols-1; i++) {
          for (int j=0; j<height; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = 0x00000000;
          }
        }
        scene1.getParent().getGraphics().updatePixels();
        image(scene1.getParent().getGraphics(), width/2, height/2);
        break;
      case SPLIT_VERTICAL:
        int rows = (int)(percentRemaining()*height/2);
        scene2.snapshot();
        scene1.getParent().getGraphics().loadPixels();
        color[] copy2 = new color[width*height];
        arrayCopy(scene1.getParent().getGraphics().pixels, copy2);
        for (int i=0; i<width; i++) {
          for (int j=0; j<=rows; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = copy2[width*(j+height/2-rows)+i];
            scene1.getParent().getGraphics().pixels[width*(height-j-1)+i] = copy2[width*(height/2+rows-j-1)+i];
          }
        }
        for (int i=0; i<width; i++) {
          for (int j=rows; j<height-rows-1; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = 0x00000000;
          }
        }
        scene1.getParent().getGraphics().updatePixels();
        image(scene1.getParent().getGraphics(), width/2, height/2);
        break;
      case SPOTLIGHT_IN:
        int radius1 = (int)(percentDone()*795);
        scene1.snapshot();
        parent.getGraphics().beginDraw();
        parent.getGraphics().blendMode(REPLACE);
        parent.getGraphics().background(0);
        parent.getGraphics().fill(0, 0, 0, 0);
        parent.getGraphics().ellipse(width/2, height/2, 2*radius1, 2*radius1);
        parent.getGraphics().endDraw();
        image(parent.getGraphics(), width/2, height/2);
        break;
      case SPOTLIGHT_OUT:
        int radius2 = (int)(percentRemaining()*795);
        scene1.snapshot();
        parent.getGraphics().beginDraw();
        parent.getGraphics().blendMode(REPLACE);
        parent.getGraphics().background(0);
        parent.getGraphics().fill(0, 0, 0, 0);
        parent.getGraphics().ellipse(width/2, height/2, 2*radius2, 2*radius2);
        parent.getGraphics().endDraw();
        image(parent.getGraphics(), width/2, height/2);
        break;
      case WIPE_DOWN:
        scene2.snapshot();
        scene1.getParent().getGraphics().loadPixels();
        for (int i=0; i<width; i++) {
          for (int j=0; j<percentDone()*height; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = 0x00000000;
          }
        }
        scene1.getParent().getGraphics().updatePixels();
        image(scene1.getParent().getGraphics(), width/2, height/2);
        break;
      case WIPE_LEFT:
        scene2.snapshot();
        scene1.getParent().getGraphics().loadPixels();
        for (int i=width-1; i>percentRemaining()*width; i--) {
          for (int j=0; j<height; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = 0x00000000;
          }
        }
        scene1.getParent().getGraphics().updatePixels();
        image(scene1.getParent().getGraphics(), width/2, height/2);
        break;
      case WIPE_RIGHT:
        scene2.snapshot();
        scene1.getParent().getGraphics().loadPixels();
        for (int i=0; i<percentDone()*width; i++) {
          for (int j=0; j<height; j++) {
            scene1.getParent().getGraphics().pixels[width*j+i] = 0x00000000;
          }
        }
        scene1.getParent().getGraphics().updatePixels();
        image(scene1.getParent().getGraphics(), width/2, height/2);
        break;
      case WIPE_UP:
        scene2.snapshot();
        scene1.getParent().getGraphics().loadPixels();
        for (int i=0; i<width; i++) {
          for (int j=height-1; j>percentRemaining()*height; j--) {
            scene1.getParent().getGraphics().pixels[width*j+i] = 0x00000000;
          }
        }
        scene1.getParent().getGraphics().updatePixels();
        image(scene1.getParent().getGraphics(), width/2, height/2);
        break;
      case ZOOM_IN:
        scene1.getState().setScale(percentDone());
        scene1.getState().setX(width/2-width/2*percentDone());
        scene1.getState().setY(height/2-height/2*percentDone());
        scene1.snapshot();
        break;
      case ZOOM_IN_2:
        scene1.snapshot();
        scene2.getState().setScale(percentDone());
        scene2.getState().setX(width/2-width/2*percentDone());
        scene2.getState().setY(height/2-height/2*percentDone());
        scene2.snapshot();
        break;
      case ZOOM_OUT:
        background(0, 0, 0);
        scene1.getState().setScale(percentRemaining());
        scene1.getState().setX(width/2-width/2*percentRemaining());
        scene1.getState().setY(height/2-height/2*percentRemaining());
        scene1.snapshot();
        break;
      case ZOOM_OUT_2:
        scene2.snapshot();
        scene1.getState().setScale(percentRemaining());
        scene1.getState().setX(width/2-width/2*percentRemaining());
        scene1.getState().setY(height/2-height/2*percentRemaining());
        scene1.snapshot();
        break;
      default: 
        println("Error! Error!");
      }
      scene1.iterateWithoutDrawing();
      if (!(to==0)) {
        scene2.iterateWithoutDrawing();
      }
      framesRemaining--;
    }
  }

  public void reset() {
    isInit = false;
    framesRemaining = duration;
    parent.getGraphics().beginDraw();
    parent.getGraphics().clear();
    parent.getGraphics().endDraw();
  }
}

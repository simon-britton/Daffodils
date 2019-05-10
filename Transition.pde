public class Transition implements Animable {
  private int framesRemaining, duration, start;
  private Scene scene1, scene2;
  private Transitions transition;

  public Transition(Transitions transition, int scene, int duration) {
    this.transition = transition;
    this.scene1 = (Scene)scenes[scene];
    this.duration = duration;
    this.framesRemaining = FRAME_RATE*duration;
    start = 0;
  } 

  public Transition(int start, Transitions transition, int scene, int duration) {
    this.transition = transition;
    this.scene1 = (Scene)scenes[scene];
    this.duration = duration;
    this.framesRemaining = FRAME_RATE*duration;
    this.start = start;
  } 

  public Transition(Transitions transition, int from, int to, int duration) {
    this.transition = transition;
    this.scene1 = (Scene)scenes[from];
    this.scene2 = (Scene)scenes[to];
    this.duration = duration;
    this.framesRemaining = FRAME_RATE*duration;
    start = 0;
  } 

  public Transition(int start, Transitions transition, int from, int to, int duration) {
    this.transition = transition;
    this.scene1 = (Scene)scenes[from];
    this.scene2 = (Scene)scenes[to];
    this.duration = duration;
    this.framesRemaining = FRAME_RATE*duration;
    this.start = start;
  } 

  public boolean isFinished() {
    return framesRemaining == -1;
  }

  public boolean started() {
    return start == 0;
  }

  public void decrementFramesRemaining() {
    if (start > 0) {
      start--;
    } else if (framesRemaining >= 0) {
      framesRemaining--;
    }
  }

  public float percentDone() {
    return 1-(float)framesRemaining/(FRAME_RATE*duration);
  }

  public float percentRemaining() {
    return (float)framesRemaining/(FRAME_RATE*duration);
  }

  public void iterate() {
    switch(transition) {
    case FADE_IN: 
      fadeIn();
      break;
    case FADE_OUT: 
      fadeOut();
      break;
    case MERGE: 
      merge();
      break;
    case SLIDE_RIGHT: 
      slideRight();
      break;
    case SLIDE_LEFT: 
      slideLeft();
      break;
    case SLIDE_UP: 
      slideUp();
      break;
    case SLIDE_DOWN: 
      slideDown();
      break;
    case COVER_RIGHT: 
      coverRight();
      break;
    case COVER_LEFT:
      coverLeft();
      break;
    case COVER_UP: 
      coverUp();
      break;
    case COVER_DOWN:
      coverDown();
      break;
    case UNCOVER_RIGHT: 
      uncoverRight();
      break;
    case UNCOVER_LEFT:
      uncoverLeft();
      break;
    case UNCOVER_UP: 
      uncoverUp();
      break;
    case UNCOVER_DOWN:
      uncoverDown();
      break;
    case ZOOM_IN:
      zoomIn();
      break;
    case ZOOM_OUT:
      zoomOut();
      break;
    case ZOOM_IN_2:
      zoomIn2();
      break;
    case ZOOM_OUT_2:
      zoomOut2();
      break;
    case COMPRESS_RIGHT:
      compressRight();
      break;
    case COMPRESS_LEFT:
      compressLeft();
      break;
    case COMPRESS_UP:
      compressUp();
      break;
    case COMPRESS_DOWN:
      compressDown();
      break;
    case STRETCH_RIGHT:
      stretchRight();
      break;
    case STRETCH_LEFT:
      stretchLeft();
      break;
    case STRETCH_UP:
      stretchUp();
      break;
    case STRETCH_DOWN:
      stretchDown();
      break;
    case CRUMPLE_RIGHT:
      crumpleRight();
      break;
    case CRUMPLE_LEFT:
      crumpleLeft();
      break;
    case CRUMPLE_UP:
      crumpleUp();
      break;
    case CRUMPLE_DOWN:
      crumpleDown();
      break;
    case UNCRUMPLE_RIGHT:
      uncrumpleRight();
      break;
    case UNCRUMPLE_LEFT:
      uncrumpleLeft();
      break;
    case UNCRUMPLE_UP:
      uncrumpleUp();
      break;
    case UNCRUMPLE_DOWN:
      uncrumpleDown();
      break;
    case WIPE_RIGHT:
      wipeRight();
      break;
    case WIPE_LEFT:
      wipeLeft();
      break;
    case WIPE_UP:
      wipeUp();
      break;
    case WIPE_DOWN:
      wipeDown();
      break;
    case SPOTLIGHT_IN:
      spotlightIn();
      break;
    case SPOTLIGHT_OUT:
      spotlightOut();
      break;
    case SPOTLIGHT_TO:
      spotlightTo();
      break;
    case SPOTLIGHT_FROM:
      spotlightFrom();
      break;
    case SPLIT_HORIZONTAL:
      splitHorizontal();
      break;
    case SPLIT_VERTICAL:
      splitVertical();
      break;
    case MERGE_HORIZONTAL:
      mergeHorizontal();
      break;
    case MERGE_VERTICAL:
      mergeVertical();
      break;
    case FADE_TO:
      fadeTo();
      break;
    case FADE_FROM:
      fadeFrom();
      break;
    case NONE:
      break;
    default: 
      println("Error! Error!");
    }
  }

  public void fadeIn() {
    scene1.snapshot();
    fill(0, 0, 0, (float)framesRemaining/(FRAME_RATE*duration)*100);
    rect(0, 0, width, height);
  }

  public void fadeOut() {
    scene1.snapshot();
    fill(0, 0, 0, 100-(float)framesRemaining/(FRAME_RATE*duration)*100);
    rect(0, 0, width, height);
  }

  public void merge() {
    scene1.snapshot((float)framesRemaining/(FRAME_RATE*duration)*100);
    scene2.snapshot(100-(float)framesRemaining/(FRAME_RATE*duration)*100);
  }

  public void slideRight() {
    scene1.getState().setX(width*percentDone());
    scene1.snapshot();
    scene2.getState().setX(-width+width*percentDone());
    scene2.snapshot();
  }

  public void slideLeft() {
    scene1.getState().setX(-width+width*framesRemaining/(FRAME_RATE*duration));
    scene1.snapshot();
    scene2.getState().setX(width*framesRemaining/(FRAME_RATE*duration));
    scene2.snapshot();
  }

  public void slideUp() {
    scene1.getState().setY(-height+height*framesRemaining/(FRAME_RATE*duration));
    scene1.snapshot();
    scene2.getState().setY(height*framesRemaining/(FRAME_RATE*duration));
    scene2.snapshot();
  }

  public void slideDown() {
    scene1.getState().setY(height*percentDone());
    scene1.snapshot();
    scene2.getState().setY(-height+height*percentDone());
    scene2.snapshot();
  }

  public void coverRight() {
    scene1.snapshot();
    scene2.getState().setX(-width+width*percentDone());
    scene2.snapshot();
  }

  public void coverLeft() {
    scene1.snapshot();
    scene2.getState().setX(width*framesRemaining/(FRAME_RATE*duration));
    scene2.snapshot();
  }

  public void coverUp() {
    scene1.snapshot();
    scene2.getState().setY(height*framesRemaining/(FRAME_RATE*duration));
    scene2.snapshot();
  }

  public void coverDown() {
    scene1.snapshot();
    scene2.getState().setY(-height+height*percentDone());
    scene2.snapshot();
  }

  public void uncoverRight() {
    scene2.snapshot();
    scene1.getState().setX(width*percentDone());
    scene1.snapshot();
  }

  public void uncoverLeft() {
    scene2.snapshot();
    scene1.getState().setX(-width+width*framesRemaining/(FRAME_RATE*duration));
    scene1.snapshot();
  }

  public void uncoverUp() {
    scene2.snapshot();
    scene1.getState().setY(-height+height*framesRemaining/(FRAME_RATE*duration));
    scene1.snapshot();
  }

  public void uncoverDown() {
    scene2.snapshot();
    scene1.getState().setY(height*percentDone());
    scene1.snapshot();
  }

  public void zoomIn() {
    scene1.getState().setScale(percentDone());
    scene1.getState().setX(width/2-width/2*percentDone());
    scene1.getState().setY(height/2-height/2*percentDone());
    scene1.snapshot();
  }

  public void zoomOut() {
    background(0, 0, 0);
    scene1.getState().setScale(percentRemaining());
    scene1.getState().setX(width/2-width/2*percentRemaining());
    scene1.getState().setY(height/2-height/2*percentRemaining());
    scene1.snapshot();
  }

  public void zoomIn2() {
    scene1.snapshot();
    scene2.getState().setScale(percentDone());
    scene2.getState().setX(width/2-width/2*percentDone());
    scene2.getState().setY(height/2-height/2*percentDone());
    scene2.snapshot();
  }

  public void zoomOut2() {
    scene2.snapshot();
    scene1.getState().setScale(percentRemaining());
    scene1.getState().setX(width/2-width/2*percentRemaining());
    scene1.getState().setY(height/2-height/2*percentRemaining());
    scene1.snapshot();
  }

  public void compressRight() {
    background(0, 0, 0);
    scene1.getState().setScale(percentRemaining(), 1);
    scene1.getState().setX(width*percentDone());
    scene1.snapshot();
  }

  public void compressLeft() {
    background(0, 0, 0);
    scene1.getState().setScale(percentRemaining(), 1);
    scene1.snapshot();
  }

  public void compressUp() {
    background(0, 0, 0);
    scene1.getState().setScale(1, percentRemaining());
    scene1.snapshot();
  }

  public void compressDown() {
    background(0, 0, 0);
    scene1.getState().setScale(1, percentRemaining());
    scene1.getState().setY(height*percentDone());
    scene1.snapshot();
  }

  public void stretchRight() {
    background(0, 0, 0);
    scene1.getState().setScale(percentDone(), 1);
    scene1.snapshot();
  }

  public void stretchLeft() {
    background(0, 0, 0);
    scene1.getState().setScale(percentDone(), 1);
    scene1.getState().setX(width*percentRemaining());
    scene1.snapshot();
  }

  public void stretchUp() {
    background(0, 0, 0);
    scene1.getState().setScale(1, percentDone());
    scene1.getState().setY(height*percentRemaining());
    scene1.snapshot();
  }

  public void stretchDown() {
    background(0, 0, 0);
    scene1.getState().setScale(1, percentDone());
    scene1.snapshot();
  }

  public void crumpleRight() {
    scene2.snapshot();
    scene1.getState().setScale(percentRemaining(), 1);
    scene1.getState().setX(width*percentDone());
    scene1.snapshot();
  }

  public void crumpleLeft() {
    scene2.snapshot();
    scene1.getState().setScale(percentRemaining(), 1);
    scene1.snapshot();
  }

  public void crumpleUp() {
    scene2.snapshot();
    scene1.getState().setScale(1, percentRemaining());
    scene1.snapshot();
  }

  public void crumpleDown() {
    scene2.snapshot();
    scene1.getState().setScale(1, percentRemaining());
    scene1.getState().setY(height*percentDone());
    scene1.snapshot();
  }

  public void uncrumpleRight() {
    scene1.snapshot();
    scene2.getState().setScale(percentDone(), 1);
    scene2.snapshot();
  }

  public void uncrumpleLeft() {
    scene1.snapshot();
    scene2.getState().setScale(percentDone(), 1);
    scene2.getState().setX(width*percentRemaining());
    scene2.snapshot();
  }

  public void uncrumpleUp() {
    scene1.snapshot();
    scene2.getState().setScale(1, percentDone());
    scene2.getState().setY(height*percentRemaining());
    scene2.snapshot();
  }

  public void uncrumpleDown() {
    scene1.snapshot();
    scene2.getState().setScale(1, percentDone());
    scene2.snapshot();
  }

  public void wipeRight() {
    scene2.snapshot();
    loadPixels();
    for (int i=width-1; i >= percentDone()*width; i--) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
      }
    }
    updatePixels();
  }

  public void wipeLeft() {
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<percentRemaining()*width; i++) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
      }
    }
    updatePixels();
  }

  public void wipeUp() {
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<width; i++) {
      for (int j=0; j<percentRemaining()*height; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
      }
    }
    updatePixels();
  }

  public void wipeDown() {
    scene2.snapshot();
    loadPixels();
    for (int i=0; i < width; i++) {
      for (int j=height-1; j >= percentDone()*height; j--) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
      }
    }
    updatePixels();
  }

  public void spotlightIn() {
    int radius = (int)(percentDone()*sqrt((float)width*width/4+(float)height*height/4));
    scene1.snapshot();
    loadPixels();
    for (int i=0; i<width/2-radius; i++) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = #000000;
        pixels[(height-1-j)*width+(width-1-i)] = #000000;
      }
    }
    for (int i=0; i<width; i++) {
      for (int j=0; j<height/2-radius; j++) {
        pixels[j*width+i] = #000000;
        pixels[(height-1-j)*width+(width-1-i)] = #000000;
      }
    }
    for (int i = max(0, width/2-radius); i <= min(width-1, width/2+radius); i++) {
      for (int j = max(0, height/2-radius); j <= min(height-1, height/2+radius); j++) {
        if ((width/2-i)*(width/2-i)+(height/2-j)*(height/2-j) >= radius*radius) {
          pixels[j*width+i] = #000000;
        }
      }
    }
    updatePixels();
  }

  public void spotlightOut() {
    int radius = (int)(percentRemaining()*sqrt((float)width*width/4+(float)height*height/4));
    background(0, 0, 0);
    loadPixels();
    for (int i = max(0, width/2-radius); i <= min(width-1, width/2+radius); i++) {
      for (int j = max(0, height/2-radius); j <= min(height-1, height/2+radius); j++) {
        if ((width/2-i)*(width/2-i)+(height/2-j)*(height/2-j) <= radius*radius) {
          pixels[j*width+i] = animator.getLastPixels()[j*width+i];
        }
      }
    }
    updatePixels();
  }

  public void spotlightTo() {
    int radius = (int)(percentDone()*sqrt((float)width*width/4+(float)height*height/4));
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<width/2-radius; i++) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
        pixels[(height-1-j)*width+(width-1-i)] = animator.getLastPixels()[(height-1-j)*width+(width-1-i)];
      }
    }
    for (int i=0; i<width; i++) {
      for (int j=0; j<height/2-radius; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
        pixels[(height-1-j)*width+(width-1-i)] = animator.getLastPixels()[(height-1-j)*width+(width-1-i)];
      }
    }
    for (int i = max(0, width/2-radius); i <= min(width-1, width/2+radius); i++) {
      for (int j = max(0, height/2-radius); j <= min(height-1, height/2+radius); j++) {
        if ((width/2-i)*(width/2-i)+(height/2-j)*(height/2-j) >= radius*radius) {
          pixels[j*width+i] = animator.getLastPixels()[j*width+i];
        }
      }
    }
    updatePixels();
  }

  public void spotlightFrom() {
    int radius = (int)(percentRemaining()*sqrt((float)width*width/4+(float)height*height/4));
    scene2.snapshot();
    loadPixels();
    for (int i = max(0, width/2-radius); i <= min(width-1, width/2+radius); i++) {
      for (int j = max(0, height/2-radius); j <= min(height-1, height/2+radius); j++) {
        if ((width/2-i)*(width/2-i)+(height/2-j)*(height/2-j) <= radius*radius) {
          pixels[j*width+i] = animator.getLastPixels()[j*width+i];
        }
      }
    }
    updatePixels();
  }

  public void splitHorizontal() {
    int cols = (int)(percentRemaining()*width/2);
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<=cols; i++) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+width/2-cols+i];
        pixels[j*width+width-1-i] = animator.getLastPixels()[j*width+width/2+cols-i-1];
      }
    }
    updatePixels();
  }

  public void splitVertical() {
    int rows = (int)(percentRemaining()*height/2);
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<width; i++) {
      for (int j=0; j<=rows; j++) {
        pixels[j*width+i] = animator.getLastPixels()[(height/2-rows+j)*width+i];
        pixels[(height-1-j)*width+i] = animator.getLastPixels()[(height/2+rows-j-1)*width+i];
      }
    }
    updatePixels();
  }

  public void mergeHorizontal() {
    int cols = (int)(percentDone()*width/2);
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<cols; i++) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = pixels[j*width+width/2-cols+i];
        pixels[j*width+width-1-i] = pixels[j*width+width/2+cols-i-1];
      }
    }
    for (int i=cols; i<width-1-cols; i++) {
      for (int j=0; j<height; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
      }
    }
    updatePixels();
  }

  public void mergeVertical() {
    int rows = (int)(percentDone()*height/2);
    scene2.snapshot();
    loadPixels();
    for (int i=0; i<width; i++) {
      for (int j=0; j<rows; j++) {
        pixels[j*width+i] = pixels[(j+height/2-rows)*width+i];
        pixels[(height-1-j)*width+i] = pixels[(height/2+rows-j-1)*width+i];
      }
    }
    for (int i=0; i<width; i++) {
      for (int j=rows; j<height-1-rows; j++) {
        pixels[j*width+i] = animator.getLastPixels()[j*width+i];
      }
    }
    updatePixels();
  }

  public void fadeTo() {
    scene1.snapshot();
    scene2.snapshot(100*percentDone());
  }

  public void fadeFrom() {
    scene2.snapshot();
    scene1.snapshot(100*percentRemaining());
  }
}

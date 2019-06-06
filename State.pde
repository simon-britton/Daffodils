public class State {
  private float x, y, theta, scaleX, scaleY, alpha, originalX, originalY, originalTheta, originalScaleX, originalScaleY, originalAlpha;
  private Canvas parent;
  
  public State(Canvas parent) {
    this.parent = parent;
    x = 0; 
    originalX = 0;
    y = 0;
    originalY = 0;
    theta = 0;
    originalTheta = 0;
    scaleX = 1;
    originalScaleX = 1;
    scaleY = 1;
    originalScaleY = 1;
    alpha = 100;
    originalAlpha = 100;
  }
  
  public State(Canvas parent, float x, float y, float theta, float scale, float alpha) {
    this.parent = parent;
    this.x = x;
    originalX = x;
    this.y = y;
    originalY = y;
    this.theta = theta;
    originalTheta = theta;
    this.scaleX = scale;
    originalScaleX = scale;
    this.scaleY = scale;
    originalScaleY = scale;
    this.alpha = alpha;
    originalAlpha = alpha;
  }
  
  public State(Canvas parent, float x, float y, float theta, float scaleX, float scaleY, float alpha) {
    this.parent = parent;
    this.x = x;
    originalX = x;
    this.y = y;
    originalY = y;
    this.theta = theta;
    originalTheta = theta;
    this.scaleX = scaleX;
    originalScaleX = scaleX;
    this.scaleY = scaleY;
    originalScaleY = scaleY;
    this.alpha = alpha;
    originalAlpha = alpha;
  }
  
  public void applyState() {
    parent.getGraphics().translate(x, y);
    parent.getGraphics().rotate(theta);
    parent.getGraphics().scale(scaleX, scaleY);
  }
  
  public State copy() {
    return new State(parent, x, y, theta, scaleX, scaleY, alpha);
  }
  
  public float getAlpha() {
    return alpha;
  }
  
  public Canvas getParent() {
    return parent;
  }
  
  public void getRandomState(float border, float x1, float x2, float y1, float y2) {
    float x, y;
    int XOrY = (int)(Math.random()*2);
    if (XOrY == 0) {
      int whichOne = (int)(Math.random()*2);
      if (whichOne == 0) {
        float random1 = (float)Math.random()*(x1-border);
        x = x1-random1;
      } else {
        float random2 = (float)Math.random()*(width-border-x2);
        x = x2+random2;
      }
      y =  border+(float)Math.random()*(height-2*border);
    } else {
      int whichOne = (int)(Math.random()*2);
      if (whichOne == 0) {
        float random1 = (float)Math.random()*(y1-border);
        y = y1-random1;
      } else {
        float random2 = (float)Math.random()*(height-border-y2);
        y = y2+random2;
      }
      x = border+(float)Math.random()*(width-2*border);
    }
    this.x = x;
    this.y = y;
  }
  
  public float getScale() {
    return (float)Math.sqrt(scaleX*scaleY);
  }
  
  public float getScaleX() {
    return scaleX;
  }
  
  public float getScaleY() {
    return scaleY;
  }
  
  public float getTheta() {
    return theta;
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
    return y;
  }
  
  public void incrementAlpha(float dAlpha) {
    alpha += dAlpha;
  }
  
  public void incrementScale(float dscale) {
    scaleX += dscale;
    scaleY += dscale;
  }
  
  public void incrementScaleX(float dscale) {
    scaleX += dscale;
  }
  
  public void incrementScaleY(float dscale) {
    scaleY += dscale;
  }
  
  public void incrementTheta(float dtheta) {
    theta += dtheta;
  }
  
  public void incrementX(float dx) {
    x += dx;
  }
  
  public void incrementY(float dy) {
    y += dy;
  }
  
  public void incrementScale(float dscaleX, float dscaleY) {
    scaleX += dscaleX;
    scaleY += dscaleY;
  }
  
  public void reset() {
    x = originalX;
    y = originalY;
    theta = originalTheta;
    scaleX = originalScaleX;
    scaleY = originalScaleY;
    alpha = originalAlpha;
  }
  
  public void setAlpha(float alpha) {
    this.alpha = alpha;
  }
  
  public void setScale(float scale) {
    this.scaleX = scale;
    this.scaleY = scale;
  }
  
  public void setScale(float scaleX, float scaleY) {
    this.scaleX = scaleX;
    this.scaleY = scaleY;
  }
  
  public void setTheta(float theta) {
    this.theta = theta;
  }
  
  public void setX(float x) {
    this.x = x;
  }
  
  public void setY(float y) {
    this.y = y;
  }
  
  public String toString() {
    return frameCount+": "+x+" "+y+" "+theta+" "+scaleX+" "+scaleY+" "+alpha;
  }
}

public class State {
  private float x, y, theta, scaleX, scaleY;
  public State(float x, float y, float theta, float scale) {
    this.x = x;
    this.y = y;
    this.theta = theta;
    this.scaleX = scale;
    this.scaleY = scale;
  }
  public State(float x, float y, float theta, float scaleX, float scaleY) {
    this.x = x;
    this.y = y;
    this.theta = theta;
    this.scaleX = scaleX;
    this.scaleY = scaleY;
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getTheta() {
    return theta;
  }
  public float getScaleX() {
    return scaleX;
  }
  public float getScaleY() {
    return scaleY;
  }
  public void incrementX(float dx) {
    x += dx;
  }
  public void incrementY(float dy) {
    y += dy;
  }
  public void incrementTheta(float dtheta) {
    theta += dtheta;
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
  public void incrementScale(float dscaleX, float dscaleY) {
    scaleX += dscaleX;
    scaleY += dscaleY;
  }
  public void setX(float x) {
    this.x = x;
  }
  public void setY(float y) {
    this.y = y;
  }
  public void setTheta(float theta) {
    this.theta = theta;
  }
  public void setScale(float scale) {
    this.scaleX = scale;
    this.scaleY = scale;
  }
  public void setScale(float scaleX, float scaleY) {
    this.scaleX = scaleX;
    this.scaleY = scaleY;
  }
  public void applyState() {
    translate(x, y);
    rotate(theta);
    scale(scaleX, scaleY);
  }
}

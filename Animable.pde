public interface Animable {
  public void decrementFramesRemaining();
  public void iterate();
  public boolean isFinished();
  public boolean started();
}

public class AudioPlayer extends AnimableObject {
  private SoundFile file;
  private boolean first;
  
  public AudioPlayer(Canvas parent, SoundFile file, float start, float duration) {
    super(parent, start, duration);
    this.file = file;
    first = true;
  }
  
  public void reset() {
    first = true;
    file.cue(0);
    super.reset();
  }
  
  public void update() {
    if (first) {
      file.play();
      first = false;
    }
  }
}

class Bullet extends GameObject {
  MPattern mPattern;

  color col;

  RicochetModule ricochetModule; // Inner class

  //--------- Constructor ------------------------------------------------------

  public Bullet() {
    // Default values
    this.position = new PVector(2000, 0); // Offscreen
    this.size = 10;
    col = color(255);

    ricochetModule = new RicochetModule();

    setMPattern(new MPattern() {
      public void move() {
        moveWithConstSpeed();
      }
    });
  }

  //----------- Main methods ---------------------------------------------------

  void display() {
    noStroke();
    fill(col);
    ellipse(position.x, position.y, size, size);
  }

  void move() {
    mPattern.move();
  }

  //------- Private inner methods ----------------------------------------------

  //--------- GETters / SETters ------------------------------------------------

  void setMPattern(MPattern newPattern) {
    newPattern.gameObject = this;
    this.mPattern = newPattern;
  }
}

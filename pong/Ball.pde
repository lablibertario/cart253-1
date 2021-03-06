// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.



class Ball {
  
  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED =0;
  int SIZE = 16;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

  // The colour of the ball
  color ballColor = color(255);
  char startKey1;
  char startKey2;

  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
  }
  
  /////////////// Methods ///////////////

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;


    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }

  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity

  void reset() {
     vx = 0;
     vy = 0;
    x = width/2;
    y = height/2;
  
  }
  
    // faceOff()
  //
  // This function creates the face-off after each reset of the ball

  void faceOff() {
    if (x == width/2 && y == height/2) {
      // Check if the ball is located in the middle
      if (keyPressed) {
      // Then check if a key is pressed by player 1 ('V')
        if (key == 'z') {
      // Tell the ball to move and to go in direction of the opposite player
          SPEED = 5;
          vx = SPEED;
          vy = SPEED;
        }
      }
      if (keyPressed) {
      // Then check if a key is pressed by player 2 ('B')
        if (key == 'm') {
      // Tell the ball to move and to go in direction of the opposite player
          SPEED = 5;
          vx = SPEED;
          vy = SPEED;
          vx = -vx;
        }
      }
    }
  }

  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")

  boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }

  // ballMiddle()
  //
  // Makes the face-off work even at the beginning, before any reset is called.
  
  boolean ballMiddle() {
    return (x == width/2 && y== height/2);
  }
  
  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
    }
  }
   
   // Draw the ball at its position
   
  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(ballColor);
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, SIZE, SIZE);
  }
}
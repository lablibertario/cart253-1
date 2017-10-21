// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Avatar avatarPlayer1;
Avatar avatarPlayer2;
<<<<<<< HEAD
//Score scorePlayer1;
//Score scorePlayer2;
=======
Score scorePlayer1;
Score scorePlayer2;
Score scorePlayer1Plus;
Score scorePlayer2Plus;
>>>>>>> 7b3b15b20252db1a6c55dcb2d3cc549d17507df9

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// Varaibles for score
int player1Points;
int player2Points;
int numberTimesBallTouchesP1;
int numberTimesBallTouchesP2;


// The background colour during play (black)
color backgroundColor = color(0);


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');
  avatarPlayer1 = new Avatar(width/2, height/2, 20, 'r', 'f', 'd', 'g');
  avatarPlayer2 = new Avatar(width/2+10, height/2+10, 20, 'u', 'j', 'h', 'k');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
 
  
  // Create the score for both players
<<<<<<< HEAD
  //scorePlayer2 = new Score(width/2, height/2, color(250));
  //scorePlayer1 = new Score(width/2, height/2, color(150));
=======
  scorePlayer2 = new Score(width/2+10, height/2+10, color(250), "score="+player2Points);
  scorePlayer1 = new Score(width/2, height/2, color(150), "score="+player1Points);
  scorePlayer1Plus = new Score(width/2+20, height/2+20, color(150), "+1");
  scorePlayer2Plus = new Score(width/2+30, height/2+30, color(250), "+1"); 
>>>>>>> 7b3b15b20252db1a6c55dcb2d3cc549d17507df9
}
  

  // draw()
  //
  // Handles all the magic of making the paddles and ball move, checking
  // if the ball has hit a paddle, and displaying everything.

  void draw() {
    // Fill the background each frame so we have animation
    background(backgroundColor);
   
    
    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();
    avatarPlayer1.update();
    avatarPlayer2.update();
    //score.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);
    //avatarPlayer1.collide(ball);
    //avatarPlayer2.collide(ball);

    // Check if the ball has gone off the screen
    if (ball.isOffScreen()) {
      // If it has, reset the ball
      ball.reset();
    }  
    if (avatarPlayer1.touchesBall()) {
      avatarPlayer1.reset();
    }  
    if (avatarPlayer2.touchesBall()) {
      avatarPlayer2.reset();
    }

    // Display the paddles and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
    avatarPlayer1.display();
    avatarPlayer2.display();
    //scorePlayer1.display();
    //scorePlayer2.display();
  }


  // keyPressed()
  //
  // The paddles need to know if they should move based on a keypress
  // so when the keypress is detected in the main program we need to
  // tell the paddles

  void keyPressed() {
    // Just call both paddles' and avatars' own keyPressed methods
    leftPaddle.keyPressed();
    rightPaddle.keyPressed();
    avatarPlayer1.keyPressed();
    avatarPlayer2.keyPressed();
    //ball.keyPressed();
  }

  // keyReleased()
  //
  // As for keyPressed, except for released!

  void keyReleased() {
    // Call both paddles' and avatars' keyReleased methods
    leftPaddle.keyReleased();
    rightPaddle.keyReleased();
    avatarPlayer1.keyReleased();
    avatarPlayer2.keyReleased();
  }


  /////////////// Labyrinth ///////////////

 /* void display() {
    // Set up the appearance of each wall
    noStroke();
    fill(color(250));
    rectMode(CENTER);

    // Draw the ball
    rect(10, 10, 20, 20);
  }*/
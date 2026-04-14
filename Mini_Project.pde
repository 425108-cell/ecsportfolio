// Slot Machine Simulator in Processing 4.0.1

// Array to store slot shapes
String[] shapes = {"CIRCLE", "SQUARE", "TRIANGLE"};
String[] slots = new String[3];  // Current slots

boolean win = false;

void setup() {
  size(600, 400);
  textAlign(CENTER, CENTER);
  textSize(32);
  
  // Initialize slots randomly
  for (int i = 0; i < slots.length; i++) {
    slots[i] = randomShape();
  }
}

void draw() {
  background(0, 150, 0); // Green background like a casino table
  
  // Display slots
  for (int i = 0; i < slots.length; i++) {
    float x = 150 + i*150;
    float y = height/2;
    drawShape(slots[i], x, y);
  }
  
  // Display win text if all match
  if (win) {
    fill(255, 215, 0); // Gold color
    text("YOU WIN!", width/2, 50);
  }
}

// Spin slots when any key is pressed
void keyPressed() {
  for (int i = 0; i < slots.length; i++) {
    slots[i] = randomShape();
  }
  
  // Check for win
  if (slots[0].equals(slots[1]) && slots[0].equals(slots[2])) {
    win = true;
  } else {
    win = false;
  }
}

// Function to get a random shape
String randomShape() { 
  int index = int(random(shapes.length));
  return shapes[index];
}

// Function to draw shapes
void drawShape(String shape, float x, float y) {
  fill(255);
  stroke(0);
  strokeWeight(2);
  
  if (shape.equals("CIRCLE")) {
    ellipse(x, y, 80, 80);
  } else if (shape.equals("SQUARE")) {
    rectMode(CENTER);
    rect(x, y, 80, 80);
  } else if (shape.equals("TRIANGLE")) {
    triangle(x, y-40, x-40, y+40, x+40, y+40);
  }
}

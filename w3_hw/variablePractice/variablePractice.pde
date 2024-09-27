int letter = 10;
char[] letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()".toCharArray();

void setup() {
  size(800, 800);
  background(0);
  //textAlign(CENTER, CENTER);
}

void draw() {
  // draw에 있을 시, 계속해서 덧 칠해지는 것
  background(0);  
}

void mouseMoved() {
  for (int i = 0; i < letter; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(8, 50);
    char chosenLetter = letters[int(random(letters.length))];

    fill(0, 255, 0);
    textSize(size);
    text(chosenLetter, x, y); 
  }
}

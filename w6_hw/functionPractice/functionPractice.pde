int randomSeed = int(random(10000));
float HOUSE_WIDTH_MIN = 100;
float HOUSE_WIDTH_MAX = 200;
float HOUSE_HEIGHT_MIN = 100;
float HOUSE_HEIGHT_MAX = 200;

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(10000));
}

void draw() {
  randomSeed(randomSeed);
  background(135, 206, 235);

 Cloud();
  float fixedY = 0.75 * height;
  fill(100, 80, 60); 
  rect(0, fixedY, width, height * 0.25);  

  for (int n = 0; n < 6; n++) {  
    house(random(0.1 * width, 0.9 * width), fixedY, random(HOUSE_WIDTH_MIN, HOUSE_WIDTH_MAX), random(HOUSE_HEIGHT_MIN, HOUSE_HEIGHT_MAX));
  }
}

void house(float x, float y, float w, float h) {
  pushStyle();
  colorMode(HSB, 360, 80, 80);
  
  fill(random(0, 360), 50, 90);
  rect(x - w / 2, y - h, w, h); 

  if (random(1) > 0.5) {
    fill(random(0, 360), 80, 80);
    triangle(x - w / 2, y - h, x + w / 2, y - h, x, y - h - 20);
  }
  
  float doorW = w * 0.2;
  float doorH = h * 0.4;
  fill(random(0, 360), 100, 60);
  rect(x - doorW / 2, y - doorH, doorW, doorH);  

  
  int windowCount = int(random(1, 4));
  for (int n = 0; n < windowCount; n++) {
    float windowW = w * 0.15;
    float windowH = h * 0.15;
    float windowX = random(x - w / 2 + windowW, x + w / 2 - windowW);
    float windowY = random(y - h + doorH, y - doorH - windowH);

    fill(200, 100, 100); 
    rect(windowX - windowW / 2, windowY - windowH / 2, windowW, windowH);
  }
  
  popStyle();
}

void Cloud() {
  fill(255, 255, 255, 200); 
  noStroke();
  
  for (int n = 0; n < 5; n++) { 
    float cloudX = random(width); 
    float cloudY = random(height * 0.1, height * 0.3); 
    ellipse(cloudX, cloudY, random(80, 120), random(30, 50)); 
    ellipse(cloudX - 30, cloudY, random(80, 120), random(30, 50)); 
    ellipse(cloudX + 30, cloudY, random(80, 120), random(30, 50)); 
  }
}

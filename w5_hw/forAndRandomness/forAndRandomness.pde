int tileNum;
int randomSeed = 0;
float noiseMult = 0.001;

void setup() {
  size(800, 800);
  rectMode(CENTER);  
}

void draw() {
  noiseSeed(randomSeed);  
  background(0);  

 
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));


  noiseMult = pow(10, map(mouseY, 0, height, -1, -4));

  float tileSize = width / float(tileNum);  

  // y값에 따라 네모의 색상 설정
  float blue = map(mouseY, 0, height, 255, 100);  // y값에 따라 색상이 어두워짐 

  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;

      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);

      fill(0); 
      stroke(255);  
      strokeWeight(1);  
      circle(centerX, centerY, tileSize * 1); 

    
      pushMatrix();
      translate(centerX, centerY);  
    
      float offset = map(row * tileNum + col, 0, tileNum * tileNum, 0, 90); 
      float rightRotation = radians(offset - (90 * noiseVal));  

      rotate(rightRotation); 
      line(0, 0, tileSize * 0.8 * 0.5, 0);  
      // 선 끝에 사각형 그리기
      float endX = tileSize * 0.8 * 0.5; 
      fill(0, 0, blue);  // 색상 설정 (y값에 따라 변화하는 밝기)
      noStroke();  
      rect(endX, 0, tileSize * 0.17, tileSize * 0.17); 
      popMatrix();
    }
  }
}

color noseColor;  

void setup() {
  size(400, 500);          
  noseColor = color(255, 0, 0);  

}

void draw() {
  background(255);         
  
  // 루돌프 얼굴
  fill(150, 75, 0);        
  ellipse(width/2, height/2, 200, 250); 
  ellipse(width/2, 280, 230, 170); 
  fill(150, 75, 0);         
  ellipse(100, height/3, 120, 30);  
  fill(150, 75, 0);        
  ellipse(300, height/3, 120, 30); 

 
  float leftEyeX = constrain(map(mouseX, 0, width, width/2 - 50, width/2 - 30), width/2 - 50, width/2 - 30);
  float rightEyeX = constrain(map(mouseX, 0, width, width/2 + 30, width/2 + 50), width/2 + 30, width/2 + 50);
  float eyeY = constrain(map(mouseY, 0, height, height/2 - 40, height/2 - 20), height/2 - 40, height/2 - 20);
  
  // 루돌프 눈
  fill(0);              
  ellipse(width/2 - 40, height/2 - 30, 50, 70);  
  ellipse(width/2 + 40, height/2 - 30, 50, 70);  
  
  fill(255);                
  ellipse(leftEyeX, eyeY, 10, 15); 
  ellipse(rightEyeX, eyeY, 10, 15);  
  
  // 루돌프 코
  fill(noseColor);
  ellipse(width/2, 250, 70, 50);  
  
  // 루돌프 입
  noFill();
  stroke(0);
  strokeWeight(3);
  arc(width/2, height/2 + 80, 80, 50, 0, PI);  // 미소
  
  // 루돌프 뿔
  stroke(150, 75, 0);
  strokeWeight(10);
  
  // 왼쪽 뿔
  line(width/2 - 70, height/2 - 130, width/2 - 100, height/2 - 200); 
  line(width/2 - 100, height/2 - 200, width/2 - 120, height/2 - 180); 
  line(width/2 - 100, height/2 - 200, width/2 - 110, height/2 - 220); 
  

  line(width/2 + 70, height/2 - 130, width/2 + 100, height/2 - 200); 
  line(width/2 + 100, height/2 - 200, width/2 + 120, height/2 - 180); 
  line(width/2 + 100, height/2 - 200, width/2 + 110, height/2 - 220); 
}

void mousePressed() {
  noseColor = color(random(255), random(255), random(255));
}

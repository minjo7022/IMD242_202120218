int centerX, centerY; 
int clockRadius = 300; 
int hourline = 200; 
int minuteline = 270; 
int secondline = 270;

void setup() {
  size(800, 800); 
  centerX = width / 2; 
  centerY = height / 2;
}

void draw() {
  background(255); 
  translate(centerX, centerY);
  stroke(0); 
  strokeWeight(12);
  noFill();
  ellipse(0, 0, 600, 600);

  for (int i = 0; i < 60; i++) {
    float angle = 360 / 60 * i; 
    float x1 = (clockRadius - 20);
    float x2 = (clockRadius - 7);
    float y1 = 0;
    float y2 = 0;


    if (i % 5 == 0) 
      strokeWeight(4); 
      stroke(0); 
    } else {
      strokeWeight(2); 
      stroke(150); 
    }

    pushMatrix(); 
    rotate(radians(angle)); 
    line(x1, y1, x2, y2); 
    popMatrix();
  }

 
  int h = hour() 
  int m = minute();
  int s = second();
 
  strokeWeight(6);
  float hourAngle = (360/ 12) * (h + m / 60); 
  pushMatrix();
  rotate(radians(hourAngle)); 
  line(0, 0, hourline, 0); 
  popMatrix(); 

 
  strokeWeight(6);
  float minuteAngle = (360 / 60) * (m + s / 60); 
  pushMatrix(); 
  rotate(radians(minuteAngle)); 
  line(0, 0, minuteline, 0); 
  popMatrix(); 

 
  strokeWeight(2);
  stroke(255, 0, 0);
  float secondAngle = (360 / 60) * s;
  pushMatrix(); 
  rotate(radians(secondAngle)); 
  line(0, 0, secondline, 0); 
  popMatrix(); 
   fill(255, 0, 0);
  ellipse(0,0,10,10);
}

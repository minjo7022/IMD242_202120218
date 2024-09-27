void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  stroke(127);
  strokeWeight(4);
  line(0, height / 4, width, height / 4);
  line(0, height / 2, width, height / 2);
  line(0, height * 3 / 4, width, height * 3 / 4);


  if (mouseY < height / 4) {
    circle(width * 0.5, height / 8, 100); 
  } else if (mouseY < height / 2) {  
    square(width * 0.5, height * 3 / 8, 100); 
  } else if (mouseY < height * 3 / 4) {
    line(width * 0.5 - 50, height * 5 / 8 - 50, width * 0.5 + 50, height * 5 / 8 + 50);
  } else {
    triangle(width * 0.5, height * 7 / 8 - 50, width * 0.5 - 50, height * 7 / 8 + 50, width * 0.5 + 50, height * 7 / 8 + 50); 
  }
}

int[] fruitAmts;
String[] fruitNames = {"apple", "orange", "banana", "kiwi", "peach", "plum", "tangerine"};
color[] fruitColors = {  
  color(255, 0, 0),    
  color(255, 165, 0),  
  color(255, 230, 70), 
  color(0, 255, 0),    
  color(255, 192, 203),
  color(128, 0, 128),  
  color(255, 165, 0)   
};

float barGap, barWidth, x, total, average;

void setup() {
  size(1280, 720);  
  fruitAmts = new int[fruitNames.length];
  for (int n = 0; n < fruitAmts.length; n++) {
    if (n == 0) {
      fruitAmts[n] = 50;
    } else {
      fruitAmts[n] = int(random(5, 100));
    }
  }
  
 
  barGap = width / (fruitNames.length + 2);
  barWidth = 24;
  
  x = (width - (barGap * (fruitNames.length - 1))) / 2;
  
  total = 0;
  for (int amt : fruitAmts) {
    total += amt;
  }
  average = total / fruitAmts.length;
}

void draw() {
  background(245, 245, 220);
  strokeWeight(barWidth);
  
  for (int n = 0; n < fruitNames.length; n++) {
    stroke(fruitColors[n]);  //
    strokeCap(SQUARE);
    fill(fruitColors[n]);
    line(x + barGap * n, height * 0.6,
      x + barGap * n, height * 0.6 - 2 * fruitAmts[n]);
      
    fill(fruitColors[n]);
    textSize(24);
    text(fruitNames[n], x + barGap * n, height * 0.6 + 20);
    text(fruitAmts[n], x + barGap * n, height * 0.6 - 2 * fruitAmts[n] - 40);
  }
  
  fill(0);
  textSize(28);
  textAlign(CENTER, TOP);
  text("Total: " + int(total) + " | Average: " + int(average), width / 2, height - 170);
}

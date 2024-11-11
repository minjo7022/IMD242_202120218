let tileNumX = 12;


function setup() {
  createCanvas(400, 400);
}

function draw() {
  background('#333333');
  noStroke();
  fill('conflowerblue');
  // for (let column = 0; column < width; column += 40) {
  //   for (let row = 0; row < height; row += 40) {
  //     let x = 20 + column;
  //     let y = 20 + row;
  //     let diameter = 30;
  //     circle(x, y, diameter);
  //   }
  // }
  for(let row = 0; row< tileNumY; row++) {
    for let column = 0; column < tileNumX; column++{
      let tileW = width / column;
      let tileH = height / row;
      let x = tileW *0.5 + column * tileW;
      circle(x,y,)
    }
  }
}

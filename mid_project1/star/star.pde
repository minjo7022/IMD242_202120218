ArrayList<Star> stars; // ArrayList 변수
int maxStars = 100; // 최대 100개의 별 
float connectionDistance = 80; // 80 이하일 때 선으로 연결 

void setup() {
  fullScreen(); // 전체화면 설정
  stars = new ArrayList<Star>(); // 별들을 저장할 새로운 ArrayList 

  for (int i = 0; i < maxStars; i++) {
    stars.add(new Star(random(width), random(height))); // maxStars만큼 별 랜덤 생성하기 
  }
}

void draw() {
  background(0); // 검정색 배경

  // GPT사용 각 별에 대한 반짝임과 위치에 대한 질문, 가까운 별끼리 연결되게 질문
  //각 별에 하나씩 접근 
  for (Star s : stars) {
    s.twinkle(); // 각 별 반짝임
    s.display(); // 각 별을 화면에 그리기
    s.updatePosition(); // 각 별의 위치 업데이트
  }

  // 가까운 별들끼리 연결해 별자리 선 그리기 
  for (int i = 0; i < stars.size(); i++) { //stars 리스트에서 첫 번째 별부터 마지막 별까지 가져오기, 요소의 개수, 크기에 맞게 반환해줌   
    for (int j = i + 1; j < stars.size(); j++) { //한 번 연결된 별들을 다시 연결하지 않게 하기 
      Star s1 = stars.get(i);
      //i번째 별을 s1에 저장 
      Star s2 = stars.get(j);
      //j번째 별을 s2에 저장, s1,s2를 통해 두 별의 거리 계산할 수 있음 
      float d = dist(s1.x, s1.y, s2.x, s2.y); // 두 별 사이의 거리 계산, 거리가 짧을수록 별끼리 가까이 있음 
      
      // 거리 내에 있는 별들만 선으로 연결
      if (d < connectionDistance) {
        stroke(255, 150); // 선 색상과 투명도
        line(s1.x, s1.y, s2.x, s2.y); // 별을 연결하는 선 그리기
      }
    }
  }

  // 현재 별의 개수를 화면에 표시
  fill(255);  //흰색 글씨 
  textSize(16); //글씨 16
  text("Number of Stars: " + stars.size(), 20, 20); // 왼쪽 상단에 현재 별의 개수 표시 

  // 최대 별 개수를 초과하면 가장 오래된 별을 제거
  if (stars.size() > maxStars) {
    stars.remove(0); // ArrayList에서 첫 번째 별을 제거해 오래된 별부터 사라지게 하기 
  }
}

void mousePressed() {
  // 마우스 클릭 시 별들이 퍼져나가는 효과
  for (int i = 0; i < 20; i++) { // 클릭할 때마다 20개의 별 추가
  //GPT 사용 마우스 주변에서 랜덤으로 별이 추가되며 퍼져나가는 것을 질문 
    stars.add(new Star(mouseX + random(-50, 50), mouseY + random(-50, 50), random(-2, 2), random(-2, 2)));
    // 마우스 위치에서 +-50 내에서 랜덤으로 별 위치 설정하고 속도를 랜덤으로 설정 
  }
}

void mouseDragged() {
  // 드래그 시 별들이 떨어지는 효과
  for (int i = 0; i < 5; i++) { // 드래그할 때마다 5개 별 추가 반복 
    stars.add(new Star(mouseX + random(-10, 10), mouseY + random(-10, 10), random(-1, 1), random(-1, 1)));
    // 별 생성 마우스 중심으로 별 램덤하게 흩어지게, 범위 내에서 랜덤하게 속도 변화 
  }
}


class Star {
  float x, y; // 별의 x, y 좌표
  float size; // 별의 크기
  float brightness; // 별의 밝기
  float twinkleSpeed; // 반짝이는 속도
  float velocityX, velocityY; // 별의 속도 (움직이는 방향과 속도)

  // 별 생성자: 기본 위치와 속도로 별을 생성
  Star(float startX, float startY) {
    x = startX;
    y = startY;
    size = random(2, 5); // 별의 크기 무작위 설정
    brightness = random(100, 255); // 밝기 무작위 설정
    twinkleSpeed = random(1, 5); // 반짝임 속도 무작위 설정
    velocityX = 0;
    velocityY = 0;
  }

  //GPT 사용 별 생성, 별의 초기 위치와 속도를 생성하고  중복값을 피하려면 어떻게 해야되는지 질문 
  Star(float startX, float startY, float startVx, float startVy) {
    this(startX, startY);  // 기존 star 위치만 설정, 속도는 0으로 초기화 해서 중복 피하기 
    velocityX = startVx;
    velocityY = startVy;
  }

  // 별의 위치 업데이트, 벽에 튕기도록 
  void updatePosition() {
    x += velocityX; // x 좌표 업데이트
    y += velocityY; // y 좌표 업데이트

    // 벽에 튕기는 효과로 화면밖에 나가지 않게 함 
    if (x < 0 || x > width) { //화면 좌우 끝을 넘었는지 확인하고 이 조건이 참이라면 별은 화면을 넘어가게 되기 때문에 튕겨야함   
      velocityX *= -1; // x 방향 속도를 반대로 변경 
    }
    if (y < 0 || y > height) {//화면 위아래  끝을 넘었는지 확인하고 이 조건이 참이라면 별은 화면을 넘어가게 되기 때문에 튕겨야함
      velocityY *= -1; // y 방향 속도를 반대로 변경 
    }
  }

  // GPT 사용 반짝이 효과 밝기 값을 반짝이는 속도만큼 증가시키고 값을 어떻게 반전 시킬 수 있는지 질문 
  void twinkle() {
    brightness += twinkleSpeed; // 별의 밝기 값을 반짝이는 속도만큼 증가시켜 반짝이게 함  
    if (brightness > 255 || brightness < 100) { // 밝기가 최대255나 최소100에 도달했을 때
      twinkleSpeed *= -1; // 값을 반전  
    }
  }

  // 별 그리기
  void display() {
    fill(255, brightness); // 밝기에 맞춰 색상 설정
    noStroke(); // 테두리 없음
    ellipse(x, y, size, size); // 원 모양으로 별 그리기
  }
}

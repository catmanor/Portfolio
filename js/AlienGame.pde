ArrayList<Alien> alienList;
int bornTimer;
Score score;
int achievementTimer;

//color in fill
color colorBackground = color(61, 89, 171);
color colorMoon = color(255, 255, 204);
color colorMain = color(60, 60, 60);
color colorSubordinate = color(255);
color colorLight = color(255, 255, 0);
color colorStarTail = color(235, 208, 70);
color colorStarBall = color(156, 124, 85);
color colorStarPointOne = color(130, 98, 60);
color colorStarPointTwo = color(108, 78, 40);
color colorFireOutside = color(222, 81, 0);
color colorFireInside = color(243, 224, 42);
color colorLaser = color(200, 219, 58);
color colorGunStock = color(109, 120, 115);
color colorGunBody = color(94, 160, 218);
color colorGunMetal = color(109,120,115);
color colorGunLogo = color(141, 31, 109);

//color in stroke
color colorMoonStroke = color(254, 250, 239, 80);
color colorTowerStroke = color(255);
color colorLightStroke = color(237, 231, 139);
color colorStarStroke = color(235, 207, 77);


void setup(){
  size(800, 600);
  alienList = new ArrayList<Alien>();
  bornTimer = 0;
  score = new Score(600, 100);
  achievementTimer = 0;
  
  for(int i = 0; i < 6; i++) {
    Alien anAlien = new Alien(random(160/2, width-160/2), random(184/2, height-184/2));
    alienList.add(anAlien);
  }
  
}

void draw(){
  drawBackground();
  
  if(alienList.size() < 10 && bornTimer >= 120) {
    Alien anAlien = new Alien(random(160/2, width-160/2), random(184/2, height-184/2));
    alienList.add(anAlien);
    bornTimer = 0;
  }
  bornTimer++;
  
    if(score.finalScore ==5 ) {
      fill(colorFireOutside);
    text("FIVE KILL, WONDERFUL JOB", 500, 550);
  }
  
    if(score.finalScore ==10 ) {
      fill(colorFireOutside);
    text("TEN KILL, AMAZING", 500, 400);
  }
  
    if(score.finalScore >= 15 ) {
      fill(colorFireOutside);
    text("YOU ARE SUPER HERO", 500, 400);
  }

  for(int i = 0; i < alienList.size(); i++) {
    Alien anAlien = alienList.get(i);
    anAlien.move();
    anAlien.drawMe();
  }
  
  for(int i = alienList.size()-1; i>=0; i--) {
    Alien anAlien = alienList.get(i);
    if (anAlien.killedTimer >= 120) {
      alienList.remove(i);
    }
  }
  score.scoreBoard();
  
  drawMouse();
}

void mousePressed() {
  for(int i = alienList.size()-1; i>=0; i--) {
    Alien anAlien = alienList.get(i);
    if (anAlien.clickAlien(mouseX, mouseY)) {
      score.finalScore++;
      break;
    }
  }

}
void drawMouse(){
  noCursor();
  pushMatrix();
  translate(mouseX, mouseY);
  fill(243, 208, 48);
  noStroke();
  scale(0.75);
  rect(-15, -6, 30, 12);
  triangle(-25, 6, -10, 6, 10, -40);
  triangle(25, -6, 10, -6, -10, 40);
  popMatrix();
  
}

  void drawBackground(){
      //background
  background(colorBackground);
  
  
  //moon
  fill(colorMoon);
  stroke(colorMoonStroke);
  strokeWeight(30);
  pushMatrix();
  translate(400, 300);
  ellipse(0, 0, 400, 400);
  popMatrix();
  
  //ground
  fill(colorMain);
  noStroke();
  rect(0, 500, 800, 600);
  
  //tower
  fill(colorMain);
  noStroke();
  rect(270, 425, 115, 75);
  triangle(290, 425, 320, 425, 325, 390);
  triangle(370, 425, 340, 425, 335, 390);
  ellipse(330, 380, 65, 55);
  rect(317, 300, 26, 90);
  ellipse(330, 290, 45, 40);
  quad(327, 190, 333, 190, 338, 280, 322, 280);
  ellipse(330, 220, 30, 25);
  stroke(colorTowerStroke);
  strokeWeight(1.5);
  noFill();
  stroke(colorMain);
  strokeWeight(2);
  line(330, 153, 330, 190);
  
  //tower-hole
  fill(colorSubordinate);
  noStroke();
  ellipse(330, 320, 10, 10);
  ellipse(330, 335, 10, 10);
  ellipse(330, 350, 10, 10);
  
  //tower-line
  noFill();
  stroke(colorTowerStroke);
  strokeWeight(3);
  curve(320, 400, 300, 370, 360, 370, 345, 400);
  curve(280, 360, 300, 390, 360, 390, 375, 360);
  line(297, 380, 363, 380);
  line(313, 290, 347, 290);
  line(322, 220, 338, 220);
  
  
  //building-rectangle
  fill(colorMain);
  noStroke();
  rect(360, 480, 175, 25);
  rect(435, 350, 60, 130);
  rect(430, 445, 70, 35);
  
  //building-rectangle-light
  fill(colorLight);
  stroke(colorLightStroke);
  strokeWeight(3);
  drawLight(455, 370);
  fill(colorLight);
  stroke(colorLightStroke);
  strokeWeight(3);
  drawLight(455, 410);
  
  
  //building-triangle-rooftree
  fill(colorMain);
  noStroke();
  rect(520, 425, 60, 95);
  rect(550, 380, 30, 45);
  triangle(565, 360, 550, 380, 580, 380);
   
  //building-triangle-rooftree-light
  fill(colorLight);
  stroke(colorLightStroke);
  strokeWeight(3);
  drawLight(555, 390);
  
  //building-world-center
  fill(colorMain);
  noStroke();
  rect(580, 470, 150, 30);
  rect(620, 205, 80, 295);
  quad(610, 160, 710, 160, 700, 210, 620, 210);
  
  //world-center-hole
  fill(colorBackground);
  noStroke();
  arc(660, 160, 100, 10, 0, PI);
  quad(630, 185, 635, 210, 685, 210, 690, 185);
  
  //damage in world center
  fill(colorBackground);
  noStroke();
  ellipse(700, 270, 50, 60);
  drawFire(693, 307);
  
  //building-rightest
  fill(colorMain);
  noStroke();
  rect(720, 400, 80, 100);
  triangle(720, 400, 800, 400, 800, 365);
  
  //damage in building-rightest
  fill(colorBackground);
  noStroke();
  ellipse(766, 390, 50, 40);
  drawFire(768, 415);
  
  //sky-wheel
  
  fill(colorMain);
  noStroke();
  rect(100, 460, 170, 40);
  ellipse(180, 350, 30, 30);
  
  //sky-triangle
  noFill();
  stroke(colorMain);
  strokeWeight(5);
  triangle(180, 350, 140, 465, 220, 465);
  
  //sky-moving
  pushMatrix();
  translate(180, 350);
  
  //sky-wheel-line
  noFill();
  stroke(colorMain);
  strokeWeight(5);
  ellipse(0, 0, 170, 170);
  line(0, 90, 0, -92);
  line(0, 0, 75, -50);
  line(0, 0, 74, 42);
  line(0, 0, -69, 51);
  line(0, 0, -72, -38);
  
  //sky-wheel-cable-car
  fill(colorMain);
  noStroke();
  drawCaberCar(-12, -100);
  drawCaberCar(60, -60);
  drawCaberCar(65, 20);
  drawCaberCar(-12, 70);
  drawCaberCar(-90, 30);
  drawCaberCar(-85, -60);
  
  popMatrix();
  
  drawFire(273, 476);
  
  //building-museum
  fill(colorMain);
  noStroke();
  rect(0, 440, 80, 60);
  arc(20, 440, 120, 70, -PI, 0);
  
  
  //star tail
  fill(colorStarTail);
  noStroke();
  triangle(84, 78, 149, 148, 176, 115);
  triangle(134, 163, 90, 112, 154, 126);
  triangle(189, 106, 137, 71, 155, 149);
  
  //shooting star
  fill(colorStarBall);
  stroke(colorStarStroke);
  ellipse(170, 140, 80, 80);
  
  //star-hole-1
  fill(colorStarPointOne);
  noStroke();
  ellipse(176, 127, 30, 20);
  ellipse(160, 160, 25, 20);
  
  //star-hole-2
  fill(colorStarPointTwo);
  noStroke();
  ellipse(180, 172, 8, 8);
  ellipse(148, 136, 15, 13);
  ellipse(198, 130, 10, 10);
}
  //cable car
void drawCaberCar(int x, int y){
  rect(x, y, 25, 30, ROUND);
  arc(x + 12.5, y, 25, 15, -PI, 0);
}

  //light
void drawLight(int x, int y){
  rect(x, y, 20, 20);
}

  //fire
void drawFire(int x, int y){
  pushMatrix();
  translate(x, y);
  fill(colorFireOutside);
  noStroke();
  triangle(-20, 0, 20, 0, 0, -60);
  triangle(0, 0, -30, 0, -20, -40);
  triangle(0, 0, 30, 0, 25, -45);
  fill(colorFireInside);
  noStroke();
  triangle(-15, -5, 10, -5, 0, -40);
  triangle(0, -5, -20, -5, -15, -20);
  triangle(0, -5, 23, -5, 18, -25);
  
  popMatrix();
  }
  
  
  class Alien {
  float x;
  float y;
  float speedX;
  float speedY;
  boolean killed;
  int killedTimer;
  float rot=0;
  float handAngle = 0;
  float handRotVel = 0.08;
  
  Alien(float x, float y){
    this.x = x;
    this.y = y;
    speedX = random(-2, 2);
    speedY = random(-2, 2);
    killed = false;
  }
  
  void drawMe(){
  pushMatrix();
  translate(x, y);
  scale(0.75);
  if(!killed) {
  
  //balls-big ball
  fill(115, 114, 137);
  stroke(0);
  strokeWeight(0.1);
  ellipse(0, 90-27, 75, 55);
  
  //balls-center
  fill(242, 234, 84);
  stroke(0);
  strokeWeight(0.1);
  ellipse(0, 90-27, 40, 30);
  
  //balls-left
  fill(242, 234, 84);
  stroke(0);
  strokeWeight(0.1);
  ellipse(-50, 90-27, 40, 30);
  
  //balls-right
  fill(242, 234, 84);
  stroke(0);
  strokeWeight(0.1);
  ellipse(50, 90-27, 40, 30);
  
  
  //dome
  fill(160, 168, 185);
  stroke(0);
  strokeWeight(0.1);
  arc(0, 60-27, 130, 80, -PI, 0);
  
  //dome-tape
  fill(0);
  noStroke();
  rect(-64, 60-27, 128, 10);
  
  //dome-logo
  fill(220, 209, 56);
  noStroke();
  pushMatrix();
  translate(0, 20);
  rotate(rot++);
  triangle(-10, 5, 10, 5, 0, -10);
  triangle(-10, -5, 10, -5, 0, 10);
  popMatrix();
  
  //dome-bottom
  fill(160, 168, 185);
  stroke(0);
  strokeWeight(0.1);
  quad(-64, 70-27, 64, 70-27, 80, 90-27, -80, 90-27);
  
  //face-up
  fill(92, 24, 87);
  stroke(255);
  strokeWeight(0.5);
  arc(0, 0-27, 100, 100, -PI, 0);
  
  //face-down
  fill(92, 24, 87);
  stroke(255);
  strokeWeight(0.5);
  curve(0, -250, -50, -1-27, 50, -1-27, 0, -250);
  
  //head
  fill(92, 79, 177);
  stroke(255);
  strokeWeight(0.5);
  arc(0, -20-27, 90, 60, -PI, 0);
  
  //clothes
  fill(23, 13, 23);
  noStroke();
  quad(-44, 16-27, 44, 16-27, 40, 35-27, -40, 35-27);
  
  //eyes
  fill(255);
  stroke(0);
  strokeWeight(1);
  arc(-22, -10-27, 20, 25, 0, PI);
  arc(22, -10-27, 20, 25, 0, PI);
  arc(0, -30-27, 20, 25, 0 , PI);
  
  //eyes-line
  fill(0);
  noStroke();
  rect(-32, -11-27, 20, 3);
  rect(12, -11-27, 20, 3);
  rect(-10, -31-27, 20, 3);
  
  //eyes-balls
  fill(163, 148, 128);
  noStroke();
  ellipse(-22, -5-27, 5, 5);
  ellipse(22, -5-27, 5, 5);
  ellipse(0, -25-27, 5, 5);
  
  //nose
  fill(138, 131, 110);
  noStroke();
  triangle(-10, 5-27, 10, 5-27, 0, -5-27);
    
  //hat
  fill(136,199,229, 80);
  noStroke();
  curve(500, 630, -44, 16-27, 44, 16-27, -500, 630);
     
    
  //hands
  pushMatrix();
  translate(25, 35);
  fill(92, 24, 87);
  stroke(0);
  strokeWeight(0.1);
  triangle(-5, 0-27, 5, 0-27, -2, 20-27);
  popMatrix();
  
  pushMatrix();
  translate(-25, 35);
  fill(92, 24, 87);
  stroke(0);
  strokeWeight(0.1);
  triangle(-5, 0-27, 5, 0-27, -2, 20-27);
  popMatrix();
  }
  else {

  
  //face-up
  fill(0, map(killedTimer, 0, 120, 255, 0));
  stroke(0, map(killedTimer, 0, 120, 255, 0));
  strokeWeight(0.5);
  arc(0, 0-27, 100, 100, -PI, 0);
  
  //face-down
  fill(0, map(killedTimer, 0, 120, 255, 0));
  stroke(0, map(killedTimer, 0, 120, 255, 0));
  strokeWeight(0.5);
  curve(0, -250, -50, -1-27, 50, -1-27, 0, -250);
  
  //head
  fill(0, map(killedTimer, 0, 120, 255, 0));
  stroke(0, map(killedTimer, 0, 120, 255, 0));
  strokeWeight(0.5);
  arc(0, -20-27, 90, 60, -PI, 0);
  
  //clothes
  fill(0, map(killedTimer, 0, 120, 255, 0));
  noStroke();
  quad(-44, 16-27, 44, 16-27, 40, 35-27, -40, 35-27);
  
  //eyes
  fill(255, map(killedTimer, 0, 120, 255, 0));
  stroke(0, map(killedTimer, 0, 120, 255, 0));
  strokeWeight(1);
  arc(0, -30-27, 20, 25, 0 , PI);
  
  //eyes-balls
  pushMatrix();
  translate(-22, -32);
  rotate(rot+=0.05);
  fill(225, 196, 77);
  noStroke();
  ellipse(0, 0, 10, 20);
  rotate(PI/3);
  ellipse(0, 0, 10, 20);
    rotate(PI/3);
  ellipse(0, 0, 10, 20);
  popMatrix();
  
  pushMatrix();
  translate(22, -32);
  rotate(rot+=0.05);
  fill(225, 196, 77);
  noStroke();
  ellipse(0, 0, 10, 20);
  rotate(PI/3);
  ellipse(0, 0, 10, 20);
    rotate(PI/3);
  ellipse(0, 0, 10, 20);
  popMatrix();
  
  //nose
  fill(138, 131, 110, map(killedTimer, 0, 120, 255, 0));
  noStroke();
  triangle(-10, 5-27, 10, 5-27, 0, -5-27);
  fill(255, 0, 0, map(killedTimer, 0, 120, 255, 0));
  rect(2, -22, 4, 10);
  
  //foot
  fill(0, map(killedTimer, 0, 120, 255, 0));
  noStroke();
  ellipse(-20, 40, 10, 40);
  ellipse(20, 40, 10, 40);
  rect(-30, 8, 60, 20, ROUND);
    
  //hands
  pushMatrix();
  translate(50, -8);
  fill(0, map(killedTimer, 0, 120, 255, 0));
  stroke(0);
  strokeWeight(0.1);
  rotate(handAngle);
  handAngle += handRotVel;
  if(handAngle > PI/3 || handAngle < -PI/3) handRotVel = -handRotVel;
  triangle(0, 0, 0, 10, 20, 3);
  popMatrix();
  
  pushMatrix();
  translate(-50, -8);
  fill(0, map(killedTimer, 0, 120, 255, 0));
  stroke(0);
  strokeWeight(0.1);
  rotate(handAngle);
  handAngle += handRotVel;
  if(handAngle > PI/3 || handAngle < -PI/3) handRotVel = -handRotVel;
  triangle(0, 0, 0, 10, -20, 3);
  popMatrix();
  }
      
   popMatrix();
  }
  
  void detectWall() {
    if (x > width + 160/2) {
      x = 0 - 160/2;
    }
    if (x < 0 - 160/2) {
      x = width + 160/2;
    }
    
    if (y > height + 184/2) {
      y = 0 -184/2;
    }
    if (y < 0 - 184/2) {
      y = height + 184/2;
    }
  }
  
  void move(){
    if(killed) {
      killedTimer++;
    }
    x += speedX;
    y += speedY;

    detectWall();
  }
  
  boolean clickAlien(int alienX, int alienY) {
    if ((alienX > x-160/2 && alienX < x+160/2) &&
    (alienY > y-184/2 && alienY < y+184/2) &&
    !killed){
      killed = true;
      speedX =0;
      speedY = 0;
      return true;
    }
    return false;
  }
}


class Score {
  int finalScore;
  int x;
  int y;
  
  Score(int x, int y) {
    finalScore = 0;
    this.x = x;
    this.y = y;
  }
  
  void scoreBoard() {
  //gun
  //gun-stock
  fill(colorGunStock);
  noStroke();
  rect(780, 525-425, 10, 30);
  
  //gun-body
  fill(colorGunBody);
  stroke(colorMain);
  strokeWeight(0.1);
  quad(794, 507-425, 794, 530-425, 764, 538-425, 764, 500-425);
  
  //gun-metal
  fill(colorGunMetal);
  noStroke();
  ellipse(760, 95, 8, 38);
  ellipse(752, 95, 8, 38);
  triangle(752, 515-425, 752, 524-425, 720, 520-425);
  
  //gun-hole
  fill(colorGunStock);
  noStroke();
  ellipse(720, 95, 10, 10);
  
  //gun-logo
  fill(colorGunLogo);
  noStroke();
  ellipse(780, 95, 20, 8);
  ellipse(780, 95, 8, 20);
  
  //gun-laser
  noFill();
  stroke(colorLaser);
  strokeWeight(35);
  line(680, 95, 600, 95);
  
  fill(0);
  textSize(20);
  text("Score: "+finalScore, x, y);
  }
}
  
  

/*

idea of connecting opposite points between two lines to form parabolas from here:
http://mathworld.wolfram.com/Parabola.html

*/


float[] coswave; 

int xVal1;
int xVal2;
int xVal3;

int yVal1;
int yVal2;
int yVal3;

void setup() {
  size(640, 360);
  xVal1 = int(random(0,width));
  xVal2 = int(random(0,width));
  xVal3 = int(random(0,width));  
  
  yVal1 = int(random(0,height));
  yVal2 = int(random(0,height));
  yVal3 = int(random(0,height));    
  
  background(255);
  //noLoop();
}

void draw() {

  int y1 = 0;
  int y2 = height/3;
  for (int i = 0; i < width; i++) {
    stroke(coswave[i]*255);
    line(i, y1, i, y2);
  }

  y1 = y2;
  y2 = y1 + y1;
  for (int i = 0; i < width; i++) {
    stroke(coswave[i]*255 / 4);
    line(i, y1, i, y2);
  }
  
  y1 = y2;
  y2 = height;
  for (int i = 0; i < width; i++) {
    stroke(255 - coswave[i]*255);
    line(i, y1, i, y2);
  }
  
}

//void setup() {
//  size(640, 360);
//  coswave = new float[width];
//  for (int i = 0; i < width; i++) {
//    float amount = map(i, 0, width, 0, PI);
//    coswave[i] = abs(cos(amount));
//  }
//  background(255);
//  noLoop();
//}

//void draw() {

//  int y1 = 0;
//  int y2 = height/3;
//  for (int i = 0; i < width; i++) {
//    stroke(coswave[i]*255);
//    line(i, y1, i, y2);
//  }

//  y1 = y2;
//  y2 = y1 + y1;
//  for (int i = 0; i < width; i++) {
//    stroke(coswave[i]*255 / 4);
//    line(i, y1, i, y2);
//  }
  
//  y1 = y2;
//  y2 = height;
//  for (int i = 0; i < width; i++) {
//    stroke(255 - coswave[i]*255);
//    line(i, y1, i, y2);
//  }
  
//}
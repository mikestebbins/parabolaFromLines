/*

idea of connecting opposite points between two lines to form parabolas from here:
http://mathworld.wolfram.com/Parabola.html

*/

int numberOfLines = 10;

int[] line1pointsX = new int[numberOfLines];
int[] line2pointsX = new int[numberOfLines];
int[] line1pointsY = new int[numberOfLines];
int[] line2pointsY = new int[numberOfLines];

int xVal1;
int xVal2;
int xVal3;

int yVal1;
int yVal2;
int yVal3;

void setup() {
  size(640, 360);
  
  xVal1 = int(random(width/2,width));
  yVal1 = int(random(0,height/2));
  
  xVal2 = int(random(0,width/2));
  yVal2 = int(random(0,height/2));
  
  xVal3 = int(random(width/2,width));  
  yVal3 = int(random(height/2,height));    
  
  background(0);
  strokeWeight(2.0);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  
  stroke(255);
  
  line(xVal1,yVal1,xVal2,yVal2);
  line(xVal2,yVal2,xVal3,yVal3);
  
  strokeWeight(5);
  stroke(255,0,0);
  
  int lengthLine1X = xVal1 - xVal2;
  int lengthLinex2X = xVal3 - xVal2;
  
  int deltaLine1X = int(lengthLine1X / numberOfLines);  
  int deltaLine2X = int(lengthLinex2X / numberOfLines);
  
  line1pointsX[0] = xVal1;
  line2pointsX[0] = xVal2;
  
  line1pointsY[0] = yVal1;
  line2pointsY[0] = yVal2;
  
  ellipse(line1pointsX[0],line1pointsY[0],2,2);

  float slopeLine1 = (yVal1 - yVal2) / (1.0 * (xVal1 - xVal2));
  println(yVal1);
  println(yVal2);
  println(xVal1);
  println(xVal2);
  println(slopeLine1);
  float slopeLine2 = (yVal3 - yVal2) / (xVal3 - xVal2);
  
  float bLine1 = yVal1 - slopeLine1 * xVal1;
  float bLine2 = yVal3 - slopeLine2 * xVal3;
   
  for (int i=1; i<numberOfLines; i++)  {
    line1pointsX[i] = line1pointsX[i-1] - deltaLine1X;
    line1pointsY[i] = int(line1pointsX[i] * slopeLine1 + bLine1);
    strokeWeight(5);
    stroke(255,0,0);
    ellipse(line1pointsX[i],line1pointsY[i],2,2);
  }

}

void draw() {
  
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
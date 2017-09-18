/*

idea of connecting opposite points between two lines to form parabolas from here:
http://mathworld.wolfram.com/Parabola.html

*/

int numberOfLines = 25;

int[] lineApointsX = new int[numberOfLines];
int[] lineBpointsX = new int[numberOfLines];
int[] lineApointsY = new int[numberOfLines];
int[] lineBpointsY = new int[numberOfLines];

int[] lineBpointsXrev = new int[numberOfLines];
int[] lineBpointsYrev = new int[numberOfLines];

int xVal1;
int xVal2;
int xVal3;

int yVal1;
int yVal2;
int yVal3;

int counter = 0;

void setup() {
  size(800, 450);
  
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
  
  int lengthLineAX = xVal1 - xVal2;
  int lengthLinex2X = xVal3 - xVal2;
  
  int deltaLineAX = int(lengthLineAX / numberOfLines);  
  int deltaLineBX = int(lengthLinex2X / numberOfLines);
  
  lineApointsX[0] = xVal1;
  lineBpointsX[0] = xVal3;
  
  lineApointsY[0] = yVal1;
  lineBpointsY[0] = yVal3;
  
  stroke(255,0,0); 
  fill(255,0,0);  
  ellipse(lineApointsX[0],lineApointsY[0],2,2);
  stroke(0,0,255);
  fill(0,0,255);   
  ellipse(lineBpointsX[0],lineBpointsY[0],2,2);
 
  float slopeLineA = (yVal1 - yVal2) / (1.0 * (xVal1 - xVal2));
  float slopeLineB = (yVal3 - yVal2) / (1.0 * (xVal3 - xVal2));
  
  // y = m * x + b
  
  float bLineA = yVal1 - slopeLineA * xVal1;
  float bLineB = yVal3 - slopeLineB * xVal3;
   
  for (int i=1; i<numberOfLines; i++)  {
    lineApointsX[i] = lineApointsX[i-1] - deltaLineAX;
    lineApointsY[i] = int(lineApointsX[i] * slopeLineA + bLineA);
    lineBpointsX[i] = lineBpointsX[i-1] - deltaLineBX;
    println(lineBpointsX[i]);
    lineBpointsY[i] = int(lineBpointsX[i] * slopeLineB + bLineB);    
    strokeWeight(5);
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(lineApointsX[i],lineApointsY[i],2,2);
    stroke(0,0,255);
    fill(0,0,255);
    ellipse(lineBpointsX[i],lineBpointsY[i],2,2);
  }


  
  lineBpointsXrev = reverse(lineBpointsX);
  lineBpointsYrev = reverse(lineBpointsY);  

  stroke(255);
  strokeWeight(2);

}

void draw() {
  
  for (int i = 0; i < numberOfLines; i++)  {
    float a = lineApointsX[i];
    float b = lineApointsY[i];
    float c = lineBpointsXrev[i];
    float d = lineBpointsYrev[i];
    line(a,b,c,d);
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
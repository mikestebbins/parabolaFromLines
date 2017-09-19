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
boolean successfulSetup = false;

void setup() {
  size(1067, 700);
  frameRate(10);
  runSetup(); 
}

void draw() {
  
  if (counter < numberOfLines && successfulSetup == true)  {
    float a = lineApointsX[counter];
    float b = lineApointsY[counter];
    float c = lineBpointsXrev[counter];
    float d = lineBpointsYrev[counter];
    line(a,b,c,d);
    counter++;
  }
  
  else  {
    counter = 0;
    successfulSetup = false;
    runSetup();
  }
  
}

void runSetup()  {
  xVal1 = int(random(width/2,width));
  yVal1 = int(random(0,height/2));
  
  xVal2 = int(random(0,width/2));
  yVal2 = int(random(0,height/2));
  
  xVal3 = int(random(width/2,width));  
  yVal3 = int(random(height/2,height));  
  
  PVector lineA = new PVector((xVal1 - xVal2), (yVal1 - yVal2));
  PVector lineB = new PVector((xVal3 - xVal2), (yVal3 - yVal2));
  float angleBetween = PVector.angleBetween(lineA, lineB);
  float angleBetweenDeg = degrees(angleBetween);
  println(angleBetweenDeg);
  
  if (angleBetweenDeg > 45.0)  { 
  
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
    strokeWeight(1.0);

    successfulSetup = true;
 
  }
  
  else  {
    runSetup();
    successfulSetup = false;
  }
}
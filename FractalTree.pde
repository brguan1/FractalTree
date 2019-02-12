private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
int x1 = 320;
int x2 = 320;
int y1 = 480;
int y2 = 380;
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(x1,y1,x2,y2);   
	drawBranches(x2,y2,100,3.15);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	if (branchLength <= smallestBranch)
	{
		line(x,y,(int)(branchLength*Math.cos(angle) + x),(int)(branchLength*Math.sin(angle) + y));
		line(x,y,(int)(x-branchLength*Math.cos(angle)),(int)(y-branchLength*Math.sin(angle)));
	}
	else
	{
		double angle1 = angle + branchAngle;
		double angle2 = angle - branchAngle;
		int endX1 = (int)(branchLength*Math.cos(angle1) + x);
		int endY1 = (int)(branchLength*Math.sin(angle1) + y);
		int endX2 = (int)(x - branchLength*Math.cos(angle2));
		int endY2 = (int)(y - branchLength*Math.sin(angle2));
		line(x,y, endX1,endY1);
		line(x,y,endX2,endY2);
		drawBranches(endX1, endY1, branchLength*fractionLength,angle1);
		drawBranches(endX2,endY2,branchLength*fractionLength,angle2);
	}
} 

class Point{
	private:
	int x = 0;
	int y = 0;
	public:
	Point(int a, int b){
		x = a;
		y = b;
	}
	int getX(){return x;}
	int getY(){return y;}
};

Point calculateMidpoint(Point a, Point b){
	return Point((a.getX() + b.getX())/2, (a.getY() + b.getY())/2);
}

int main(){
	Point origin = Point(0,0);
	Point target = Point(100,100);
	Point midpoint = calculateMidpoint(origin, target);
	return 0;
}
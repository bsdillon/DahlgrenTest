
class Point{
	private:
	int x = 0, y = 0;
	public:
	Point(int a, int b){
		x = a;
		y = b;
	}
	int getX(){
		return x;
	}
	int getY(){
		return y;
	}
	void setX(int x){
		this->x = x;
	}
	void setY(int y){
		this->y = y;
	}
	void setXY(int x, int y){
		this->x = x;
		this->y = y;
	}
};



int main(int argc, char *argv[]){
	Point newPoint(10, 24);
	Point pointArray[] = {Point(1,2), Point(3,4), Point(45,46), newPoint};
	int pos = 2;
	int output = pointArray[pos].getX();
	pointArray[0].setY(20);
	pointArray[1].setXY(4, 20);
	output = pointArray[3].getY();
	return output;
}
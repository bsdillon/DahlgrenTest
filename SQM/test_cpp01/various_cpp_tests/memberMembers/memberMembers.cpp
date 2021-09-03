class a 
{
	private:
		std::list<std::string> l1 = {};
		std::list<int> l2 = {};
	public:
		b objB = b(1, 2);
		a(std::list<std::string> i1, std::list<int> i2)
		{
			l1 = i1;
			l2 = i2;
		}
		std::list<std::string> getL1() {
			return l1;
		}
		std::list<int> getL2() {
			return l2;
		}
		void setL1(std::list<std::string> i1)
		{
			l1 = i1;
		}
		void setL2(std::list<int> i2)
		{
			l2 = i2;
		}
};
class b 
{
	private:
		int x, y;
	public:
		b(int a, int b)
		{
			x = a;
			y = b;
		}
		int getX() const
		{
			return x;
		}
		int getY()
		{
			return y;
		}
		void setX(int a) 
		{
			x = a;
		}
		void setY(int b)
		{
			y = b;
		}
};

std::list<int> foo(int i)
{
	return { i , 2 };
}

int main()
{
	a obj = a({ "hello", "world" }, { 1,2 });
	obj.objB.getX();
	int n = 1;
	foo(n).front();
}
class a {
	private:
		std::list<std::string> l1 = {};
		std::list<int> l2 = {};
	public:
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
void main()
{
	a obj = a({ "hello", "world" }, { 1,2 });
	obj.getL1().front().find('h');
}
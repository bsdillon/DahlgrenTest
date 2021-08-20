#include <iostream>
#include <typeinfo>

using namespace std;

int main()
{
	cout<<true<<endl;
	cout<<typeid(true).name()<<endl;
	
	cout<<3<<endl;
	cout<<typeid(3).name()<<endl;
	
	cout<<03<<endl;
	cout<<typeid(03).name()<<endl;
	
	cout<<0x10c3<<endl;
	cout<<typeid(0x10c3).name()<<endl;
	
	cout<<0b001001<<endl;
	cout<<typeid(0b001001).name()<<endl;
	
	cout<<3u<<endl;
	cout<<typeid(3u).name()<<endl;
	
	cout<<3l<<endl;
	cout<<typeid(3l).name()<<endl;
	
	cout<<3ll<<endl;
	cout<<typeid(3ll).name()<<endl;
	
	//not until C++23...
	//cout<<3z<<endl;
	//cout<<typeid(3z).name()<<endl;
	
	cout<<3e-1<<endl;
	cout<<typeid(3e10).name()<<endl;
	
	cout<<3.<<endl;
	cout<<typeid(3.).name()<<endl;
	
	cout<<3.12<<endl;
	cout<<typeid(3.12).name()<<endl;
	
	cout<<0x1ffp10<<endl;
	cout<<typeid(0x1ffp10).name()<<endl;
	
	cout<<0x1.p0<<endl;
	cout<<typeid(0x1.p0).name()<<endl;
	
	cout<<0x0.123p-1<<endl;
	cout<<typeid(0x0.123p-1).name()<<endl;
	
	cout<<3.12f<<endl;
	cout<<typeid(3.12f).name()<<endl;
	
	cout<<3.12l<<endl;
	cout<<typeid(3.12l).name()<<endl;
	
	cout<<'\n'<<endl;
	cout<<typeid('\n').name()<<endl;
	
	//not until C++17...
	//cout<<u8'\n'<<endl;
	//cout<<typeid(u8'\n').name()<<endl;
	
	cout<<u'猫'<<endl;
	cout<<typeid(u'猫').name()<<endl;
	
	cout<<U'🍌'<<endl;
	cout<<typeid(U'🍌').name()<<endl;
	
	cout<<L'β'<<endl;
	cout<<typeid(L'β').name()<<endl;
	
	cout<<'AB'<<endl;
	cout<<typeid('AB').name()<<endl;
	
	cout<<L'AB'<<endl;
	cout<<typeid(L'AB').name()<<endl;
	
	cout<<"hello"<<endl;
	cout<<typeid("hello").name()<<endl;
	
	cout<<"goodbye"<<endl;
	cout<<typeid("goodbye").name()<<endl;
	
	cout<<L"hello"<<endl;
	cout<<typeid(L"hello").name()<<endl;
	
	cout<<u8"hello"<<endl;
	cout<<typeid(u8"hello").name()<<endl;
	
	cout<<u"hello"<<endl;
	cout<<typeid(u"hello").name()<<endl;
	
	cout<<U"hello"<<endl;
	cout<<typeid(U"hello").name()<<endl;
	
	cout<<R"(hello\n)"<<endl;
	cout<<typeid(R"(hello\n)").name()<<endl;
	
	cout<<nullptr<<endl;
	cout<<typeid(nullptr).name()<<endl;
	
	return 0;
}
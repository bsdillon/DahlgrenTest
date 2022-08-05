typedef char C;
typedef unsigned int WORD;
typedef char* pChar;
typedef char field[50];



struct Boint
{
	double a;
	double b;
};


typedef struct {
    double x;
    double y;
} Point;


int main ()
{
	C a = 'c';
	WORD b = 1;
	pChar c = &a;
	field d = "hello world";

	Point e {3.14, 2.71};
	return 0;
}
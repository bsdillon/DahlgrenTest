public class OperatorTest{

     public static void main(String []args){
        	// some additions
	int a = 0;
	int b = a++;
	int c = ++a;
	int d = b+c;
	int e = 2+d;
	int f = 2+3;
	
	//some subtractions
	int g = -1;
	int h = g--;
	int i = --g;
	int j = h-i;
	int k = 2-j;
	int l = 2-3;
	
	//some multiplications
	int m = 1;
	int n = m*2;
	int o = m*n;
	int p = 2*3;
	
	//some divisions
	int q = 4;
	int r = q/2;
	int s = q/r;
	int t = 4/2;
	
	float u = 1;
	float v = u/2;
	float w = u/v;
	float x = 1/2;
	
	//some modulos
	int y = 5;
	int z = y%3;
	int aa = y%z;
	int ab = 100%60;
	
	int zz = ((a+g)*n)%y;
	
	//compound assignment
	a += m;
	a += 5;
	a -= m;
	a -= 5;
	m *= n;
	m *= 2;
	q /= r;
	q /= 2;
	u /= v;
	u /= 2;
	
	//comparison
	boolean yes = true;
	boolean no = false;
	boolean equality = yes == no;
	boolean nequality = yes != no;
	boolean lt = a < b;
	boolean gt = a > 2;
	boolean lte = a <= b;
	boolean gte = a >= 2;
	
	//logic
	boolean negate = !yes;
	boolean all = yes && no;
	boolean any = yes || no;
     }
}
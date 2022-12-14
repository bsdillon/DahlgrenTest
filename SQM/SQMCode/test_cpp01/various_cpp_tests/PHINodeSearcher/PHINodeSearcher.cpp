int testAbs(int a){
	return a < 0 ? -a : a;
}

int testMin(int m, int n){
	return n < m ? n : m;
}

int testBoolNegate(int f){
	int g = 1;
	return f ? 0 : g;
}

int testChaos(int p, int q, bool flip){
	if (flip){
		return p < q ? p : q;
	} else {
		return p > q ? p : q;
	}
}

int main(){
	int z = testAbs(3);
	int y = testAbs(-4);
	int x = testMin(z,y);
	int w = testBoolNegate(1);
}
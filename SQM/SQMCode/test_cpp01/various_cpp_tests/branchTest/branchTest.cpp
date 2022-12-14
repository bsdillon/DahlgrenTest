int scaryBranches(int x){
	int y;
	int q;
	if (x == 0)
		y = 1;
	else if (x == 1)
		y = -1;
	else
		y = 0;
	
	if (y == 0)
		y = 0;
	
	if (y == 0)
		y = 0;
	else
		q = y;
	
	return y;
}

int scaryBranchesTwo(int x){
	//{
		int y;
		int q;
		if (x == 0) y = 1;
		else if (x == 1) y = -1;
		else y = 0;
		
		if (y == 0) y = 0;
		
		if (y == 0) y = 0;
		else q = y;
		
		if (y != 0) scaryBranches(scaryBranches(3));
		
		return y;
	//}
}

int scaryBranchesThree(int x){
	int y;
	if (x >= 0){
		int q;
		if (x == 0){
			y = 1;
		} else if (x == 1) {
			y = -1;
		} else {
			y = 0;
		}
	
		if (y == 0){
			y = 0;
		}
	
		if (y == 0){
			y = 0;
		} else {
			q = y;
		}
	}else{
		y = 0;
	}
	
	return y;
}

int main(){
	int x = 0;
	int y;
	int q;
	if (x == 0){
		y = 1;
	} else if (x == 1) {
		y = -1;
	} else {
		y = 0;
	}
	
	if (y == 0){
		y = 0;
	}
	
	if (y == 0){
		y = 0;
	} else {
		q = y;
	}
	
	int z = scaryBranches(0);
	int a = scaryBranchesTwo(0);
	int b = scaryBranchesThree(0);
	return y + z + a + b;
}
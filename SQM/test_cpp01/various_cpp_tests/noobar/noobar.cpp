#include <string>

int globalInt = 10, otherGlobalInt = 20;
char globalChar = 'A';
float globalFloat = 0.5;
bool gloBool = true;
std::string globalString = "Howdy world!";
int globalZero = 0;
int globalDeclare;
int *globalIntPointer = &globalInt;

static int staticGlobal = 0;

enum elements {plastic, meat, metal, smoke};

static int mul_add(int x, int y, int z) {
	int q = z;
	q = x + y + z;
	return x * y + z;
}

int main(){
	std::string newString = globalString;
	static int m = 0;
	for (int i=0; i<5; i++){
		for(int j=0;j<5;j++){
			for(int k=0;k<5;k++){
				m = mul_add(i,j,k);
				m += staticGlobal;
			}
		}
	}
	if (m == 0){
		return m;
	} else if (m < 10 ){
		return mul_add(globalZero, m, globalInt);
	}
	return globalInt;
}

int switchKind(int choice){
	elements e;
	switch(e){
		case plastic:
		break;
		case meat:
		break;
		case metal:
		break;
		case smoke:
		break;
		default:
		break;
	}
	
	switch(1){
		case 1:
		break;
		default:
		break;
	}
	return 0;
}
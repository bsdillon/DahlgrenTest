int main(int argc, char** argv) {
	
  int x = 0;
  int full = 9;
  int element = 0;
  
  ExampleClass ec;
  ec.setA(5);
  ec.setB(6);
  
  // While node check
  while(x <= full) {
  	x++;
	element = x;
  }
  
  // ArrayInvoke node check
  int array[3]{0,1,2};
  // For3Loop node check
  for(int i = 0; i <= 2; i++) {
  	element = array[i];
  }
  // ForEachLoop
  for (int i : array) {
	element = i;
  }
  
  int value = 0;
  // Then, Else node check
  if (value == 0) {
	element = 0;
  } else if (value == 1) {
	element = 1;
  } else {
	element = -1;
  }
  // Switch node check
  switch(value) {
	case 0 :
		element = 0;
		break;
	case 1 :
		element = 1;
		break;
	default :
		element = -1;
  }
  // Trinary node check
  element = (value == 0) ? 0 : -1;

  return 0;
}


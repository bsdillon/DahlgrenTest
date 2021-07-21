import java.util.ArrayList;
import java.util.Random;
class TestCases {
	private String name;
	private int age;
	private ArrayList<Object> arr;
	public void method() {
    	arr.add(age);
        System.out.println(getName());
	}	
	public void main(String[] args) {
		setName("hello");
    	age = (int) (Math.random()*10);
    	arr = new ArrayList<>();
    	if(age >= 4) {
    		System.out.println(age);
    	}
        method();
    }
	public void testMethod() {
		int x = 100;
	}
	public String getName() {
		return name;
	}
	public void setName(String s) {
		name = s;
	}
	public int getAge() {
		return age;
	}
	public ArrayList<Object> getArr() {
		return arr;
	}
	public int testReturn(int i, String s, ArrayList<?> a, Long l) {
		int testing = 0;
		return testing;
	}
	public void whileLoop() {
		int x = 0;
		while(x < 2) {
			x++;
		}
	}
	public void forLoop() {
		for(int x=0; x < 2; x++) {
			continue;
		}
	}
	public void doWhileLoop() {
		int x = 0;
		do {
			x++;
		} while (x < 2);
	}
	public void multiForLoop() {
		for(int x=0; x < 2; x++) {
			for(int j=2; j < 4; j++) {
				continue;
			}
		}
	}
}
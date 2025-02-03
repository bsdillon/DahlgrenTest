public class DotExpression{
    int x = 1;
    int y = 2;
    
    public void method1() {
        this.x = 3;
        return this.x;
    }

    public void method2(DotExpression other) {
        other.y = this.x + this.y;
        int z = other.method1();
    }
    
}
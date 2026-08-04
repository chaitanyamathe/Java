interface Test1{
void print();
}
interface Test2{
void print();
}

class Test3 implements Test1,Test2{
public void print(){
System.out.println("in print...");
}
}
class MultipleDemo{
public static void main(String args[]){
Test3 test3=new Test3();
test3.print();
}
}

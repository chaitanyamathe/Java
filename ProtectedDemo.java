//protected access modifier 

class ProtectedDemo{
protected int number;
void display(){
System.out.println("Number = "+number);
}
public static void main(String args[]){
ProtectedDemo obj=new ProtectedDemo();
obj.display();
}
}
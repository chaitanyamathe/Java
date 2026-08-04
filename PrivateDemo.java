//private access modifier 

class PrivateDemo{
private int number;
void display(){
System.out.println("Number = "+number);
}
public static void main(String args[]){
PrivateDemo obj=new PrivateDemo();
obj.display();
}
}
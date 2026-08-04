//private access modifier 

class PrivateDemo1{
private int number;
void display(){
System.out.println("Number 1 = "+number);
}
}
class PrivateDemoo extends PrivateDemo1{
void print(){
System.out.println("Number 0 = "+number);
}
public static void main(String args[]){

}
}
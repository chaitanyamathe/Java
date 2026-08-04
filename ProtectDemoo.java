//protected access modifier 

class ProtectedDemo1{
protected int number;
void display(){
System.out.println("Number 1 = "+number);
}
}
class ProtectDemoo extends ProtectedDemo1{
void print(){
System.out.println("Number 0 = "+number);
}
public static void main(String args[]){

}
}
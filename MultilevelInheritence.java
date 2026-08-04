clas3s Base{
void displayBase(){
System.out.println("In display Base...");
}
}
class Derivedl extends Base{
void displayDerived1(){
System.out.println("In display derived1...");
}
}
class Derived2 extends Derived1{
void displayDerived2(){
System.out.println("In display derived2...");
}
}
class MultilevelInheritence{
public static void main(String args[]){
Derived2 der2 = new Derived2();
der2.displayDerived2();
der2.displayDerived1();
der2.displayBase();
}
}
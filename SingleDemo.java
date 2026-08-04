//constructor in inheritance
class Parent_1{
Parent_1(){
System.out.println("In parent constructor display");
}
void displayParent_1()
{
System.out.println("In parent display");
}
}
class Child_1 extends Parent_1{
Child_1(){
System.out.println("In child constructor display");
}
void print(){
System.out.println("In child display");
}
}
class SingleDemo{
public static void main(String args[]){
Child_1 obj=new Child_1();
obj.displayParent_1();
obj.print();
}
}
//Multi Inheritence
class Parent1{
void display(){
System.out.println("In parent1 display...");
}
}
class Parent2{
void display(){
System.out.println("In parent2 display...");
}
}

class Child extends Parent1,Parent2{
void print(){
System.out.println("In Child display...");
}
}
class Multi_Inhertitnece{
public static void main(String args[]){
Child chill=new Child();
chill.display();          //same name in the parent 2 and parent1 it shows complie time error
                          //that s why we cant use multiple inheritence
chill.print();
}
}

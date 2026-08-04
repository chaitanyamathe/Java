class Super{
void displaySuper(){
System.out.println("In super display...");
}
}
class Sub1 extends Super{
void displaysub1(){
System.out.println("In sub1 display...");
}
}
class Sub2 extends Sub1{
void displaysub2(){
System.out.println("In sub2 display...");
}
}
class Hirority{
public static void main(String args[]){
Sub1 sub1=new Sub1();
sub1.displaySuper();
sub1.displaysub1();
sub1.displaysub2();
}
}
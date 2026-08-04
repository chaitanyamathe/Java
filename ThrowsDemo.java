public class ThrowsDemo{
void div() throws ArithmeticException,ArrayIndexOutOfBoundsException{
int x=20/0;
int a[]={1};
}
public static void main(String args[]){
try{
new ThrowsDemo().div();
}
catch(ArithmeticException e){
System.out.println("Error");
}
catch(Exception e){
System.out.println(e.getMessage());
}
}
}
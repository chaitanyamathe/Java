public class ExceptionDemo{
public static void main(String args[]){
System.out.println("Exception demo strats");
int x=0;
try{
int y=50/x;
System.out.println(" y = "+y);
}
catch(ArithmeticException ae){
System.out.println("Exception Caugh");
}
System.out.println("Demo ends");
}
}
public class MultiDemo{
public static void main(String args[]){
try{
int x=50/0;//ArithmeticException
int a[]={1};
System.out.println("a[2]="+a[2]);//ArrayIndexOutOfBoundsException
}
catch(ArithmeticException e){
System.out.println("Exception:"+e.getMessage());
}
catch(ArrayIndexOutOfBoundsException e){
System.out.println("Exception:"+e);
}
catch(Exception e)
{
System.out.println(e.getMessage());
}
}
}
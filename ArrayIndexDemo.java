//ArrayIndexOfBoundsException
public class ArrayIndexDemo{
public static void main(String args[]){
System.out.println("ArrayIndexOfBoundsException ");
int a[]={11,22,33,44,55};
try{
System.out.println("a[3]="+a[7]);
}
catch(ArrayIndexOutOfBoundsException e){
System.out.println(e.getMessage());
}
finally{
System.out.println("Demo ends");
}
}
}
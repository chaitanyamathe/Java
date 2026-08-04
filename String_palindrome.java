//palindrome or not using stringsBuffer
import java.util.Scanner;
class String_palindrome{
public static void main(String args[]){
Scanner scan=new Scanner(System.in);
String str=scan.next();
StringBuffer sb = new StringBuffer(str);
sb.reverse();
String rev = new String(sb);
if(str.equals(rev))
{
System.out.println("The given string is palindrome  :"+rev);
}
else
{
System.out.println("The given string is not a palindrome  :"+rev);
}
}
}



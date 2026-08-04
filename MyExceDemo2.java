import java.util.Scanner;
class InvlaidMarksException extends Exception{
public String toString(){
return "Invalid marks,as marks should be between 0 and 100";
}
}
public class MyExceDemo2{
public static void main(String args[]){
Scanner scan=new Scanner(System.in);
System.out.println("Enter a subject marks");
int marks=scan.nextInt();
try{
if(marks<0||marks>100)
throw new InvlaidMarksException();
else if (marks >= 90) {
           System.out.println("A Grade");
        }
        else if (marks >= 80) {
           System.out.println("B Grade");      
  }
        else if (marks >= 70) {
            System.out.println("C Grade");
        }
        else if (marks >= 60) {
            System.out.println("D Grade");       
 }
        else {
            System.out.println("F Grade");       
 }
}
catch(InvlaidMarksException e){
System.out.println(e);
}
}
}
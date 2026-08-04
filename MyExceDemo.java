import java.util.Scanner;
class VoterAgeException extends Exception{
VoterAgeException(String msg){
super(msg);
}
}
public class MyExceDemo{
public static void main(String args[]){
Scanner scan=new Scanner(System.in);
System.out.println("Enter person age");
int age=scan.nextInt();
System.out.println("voting process...");
try{
if(age<18)
throw new VoterAgeException("Not Eliglible to vote as age<18");
else
System.out.println("Person eligible for vote");
}
catch(VoterAgeException e){
System.out.println(e.getMessage());
}
System.out.println("voting process done...");
}
}
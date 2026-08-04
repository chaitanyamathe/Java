import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
public class ConsoleIODemo{
public static void main(String args[]) throws IOException{
BufferedReader br=new BufferedReader(new InputStreamReader(System.in));

/*String str=br.readLine();
System.out.println(str);
char ch=(char)br.read();*/

/*char ch;
System.out.println("Enter char values and please enter q to exit");
while(true){
ch=(char)br.read();
if(ch=='q') break;
System.out.println(ch);
}*/
String msg;
System.out.println("Enter String values and please enter quit to exit");
while(true){
msg=br.readLine();
if(msg.equals("quit")) break;
System.out.println(msg);
}
}
}
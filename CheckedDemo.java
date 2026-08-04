import java.io.FileReader;
public class CheckedDemo{
public static void main(String args[]){
try{
FileReader file= new FileReader("sample.txtx");
}
catch(FileNotFoundException e){
System.out.println(e);
}
}
}
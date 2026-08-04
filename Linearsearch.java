import java.util.Scanner;
class Linearsearch{
public static void main(String args[]){
int[] a=new int[5];
int flag=0;
Scanner scan=new Scanner(System.in);
for(int i=0;i<a.length;i++)
{
  System.out.println("Enter the "+(i+1)+" Element =");
  a[i]=scan.nextInt();
}
System.out.println("Enter the search element = ");
int search=scan.nextInt();
for(int i=0;i<a.length;i++)
{
    if(search==a[i])
     {
       flag=1;
       break;
     }
}
if(flag==1)
{
  System.out.println("Element "+search+" found ");
}
else
{
 System.out.println("Element "+search+" not found ");
}
}
}
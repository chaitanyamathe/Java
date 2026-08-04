//write a java program to find max value among three integers

import java.util.Scanner;
class Maxvalue
{
	public static void main(String arr[])
	{
		int a,b,c,max;
		Scanner scan=new Scanner(System.in);
		System.out.println("Enter three integers: ");
		a=scan.nextInt();
		b=scan.nextInt();
		c=scan.nextInt();
		max=(a>b)?((a>c)?a:c):((b>c)?b:c);
		System.out.print("The max number is "+max);
	}
}
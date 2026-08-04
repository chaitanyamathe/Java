//write a java program to multiply two integers which are supplied at runtime

import java.util.Scanner;
class MultiTest
{
	public static void main(String arr[])
	{
		int num1,num2;
		Scanner scan=new Scanner(System.in);
		System.out.println("Enter two integers: ");
		num1=scan.nextInt();
		num2=scan.nextInt();
		int product=num1*num2;
		System.out.print("Result="+product);
	}
}
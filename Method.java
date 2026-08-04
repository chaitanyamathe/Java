import java.util.Scanner;
class Method
{
	int number;
	
	void read()
	{
		System.out.print("Enter a number to find its square: ");
		Scanner scan=new Scanner(System.in);
		number=scan.nextInt();
	}
	void root()
	{
		double s=Math.sqrt(number);
		System.out.println("The root of number is "+s);
	}
	public static void main(String a[])
	{
		
		Method m=new Method();
		m.read();
		m.root();
	}
}
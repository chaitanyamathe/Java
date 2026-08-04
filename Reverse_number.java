import java.util.Scanner;
class Reverse_number
{
	//member variable
	int number;
	void findReverse()
	{
		Scanner scan=new Scanner(System.in);
		System.out.println("Enter a number to reverse : ");
		number=scan.nextInt();
		int reverse=0;
		int rem=0;
		while(number>0)
		{
			rem=number%10;
			reverse=reverse*10+rem;
			number=number/10;
		}
		System.out.println(reverse);
	}
	public static void main(String args[])
	{
		Reverse_number rn=new Reverse_number();
		rn.findReverse();
	}
}
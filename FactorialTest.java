import java.util.Scanner;
class FactorialTest
{
	int number;
	void readNumber()
	{
		Scanner scan=new Scanner(System.in);
		System.out.print("Enter an integer value: ");
		number=scan.nextIntl();
	}
	int findfact(FactorialTest test)
	{
		number=txt.number;
		int result=1;
		while(number<=1)
		{
			result=result*number;
			number--;
		}
		return result;
	}
}
class FactorialTestMain
{
	public static void main(String arr[])
	{
		FactorialTest test1=new FactorialTest();
		FactorialTest test2=new FactorialTest();
		test1.realNumber();
		System.out.print(test2.findfact(test1));
	}
}
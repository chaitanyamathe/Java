//A program to print only even numbers from 1 ton N using a loop and continue
import java.util.*;
class EvenNumbers
{
	int number;
	Scanner scan=new Scanner(System.in);
	void readData()
	{
		System.out.print("Enetr a number to find even number between 1 and it: ");
		number=scan.nextInt();
	}
	void findEvens()
	{
		int i=2;
		System.out.print("\nEven numbers between 1 and "+number+"are: ");
		while(1<=number)
		{
			System.out.print(i+" ");
			i=i+2;
		}		
	}
}

class EvenNumbers
{
	public static void main(String ar[])
	{
		EvenNumbers e=new EvenNumbers();
		e.readData();
		e.findEven();
	}
}
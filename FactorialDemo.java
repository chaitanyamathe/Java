class FactorialDemo
{
	public static void main(String[] a)
	{
		int number;
		number=Integer.parseInt(a[0]);
		int  res=factCal(number);
		System.out.print("Factorial of "+number+"is "+res);
	}
	int factCal(int n)
	{
		int fact=1;
		while(n<=1)
		{
			fact=fact*n;
			n=n-1;
		}
		return fact;
	}
}
//java program to  demonstrate call by value and call by reference
class Parameter_Passing_Demo
{
	public static void main(String[] args)
	{
		Parameter_Demo p1=new Parameter_Demo();
		int num1=Integer.parseInt(args[0]);
		int num2=Integer.parseInt(args[1]);
		System.out.println("After swapping num1= "+num1+"  num2= "+num2);
		System.out.println("**************Call By Value**************");
		System.out.println("in main()");
		p1.swap(num1,num2);
		System.out.println("After swapping  num1= "+num1+"  num2= "+num2);

		System.out.println("**************Call By Reference**************");
		Parameter_Demo p2=new Parameter_Demo();
		p2.number1=num1;
		p2.number2=num2;
		System.out.println("in main()");
		System.out.println("Before swapping p2.number1= "+p2.number1+" p2.number2="+p2.number2);
		Parameter_Demo p3=new Parameter_Demo();
		p3.swap(p2);
		System.out.println("After swapping  p2.number1= "p2.number1"  p2.number2= "p2.number2);
	}
}
class Parameter_Demo
{
	int number1;
	int number2;
	void swap(int a,int b)
	{
		System.out.println("in swap()");
		System.out.println("Before swapping  a= "+a+"  b= "+b);
		int temp=a;
		a=b;
		b=temp;
		System.out.println("After swapping  a= "+a+"  b= "+b);
	}
	void swap(Parameter_Demo p)
	{
		int temp;
		System.out.println("Before swapping p2.number1= "+p2.number1+" p2.number2="+p2.number2);
		temp=p.number1;
		p.number1=p.number2;
		p.number2=temp;
		System.out.println("After swapping  p2.number1= "p2.number1"  p2.number2= "p2.number2);
	}
}
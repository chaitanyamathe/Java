class Const_Demo
{
	int number;
	Const_Demo(int num)
	{
		number=num;
	}
	
	Const_Demo()
	{
		number=900;
	}
	
	Const_Demo(Const_Demo d)
	{
		number = d.number;
	}
	void print()
	{
		System.out.println("Number= "+number);
	}
	public static void main(String args[])
	{
		Const_Demo cd=new Const_Demo();
		Const_Demo cd2=new Const_Demo(300);
		Const_Demo cd3=new Const_Demo(cd2);
		cd.print();
		cd2.print();
		cd3.print();
	}
}
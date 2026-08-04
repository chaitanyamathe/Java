class ConstDemo
{
	int number;
	double perc;
	
	//default
	ConstDemo()
	{
		number=34;
		perc=67.89;
	}
	
	//paramatarised
	ConstDemo(int number,double perc)
	{
		this.number=number;
		this.perc=perc;
	}
	
	//paramatarised(copy)
	ConstDemo(ConstDemo d)
	{
		number=d.number;
		perc=d.perc;
	}
	
	void print()
	{
		System.out.println("number= "+number+"\nperc= "+perc);
	}
	
	public static void main(String args[])
	{
		System.out.println("\nDefault Constructor");
		ConstDemo cd1=new ConstDemo();
		cd1.print();
		
		System.out.println("\nParametarised Constructor");
		ConstDemo cd2=new ConstDemo(Integer.parseInt(args[0]),Double.parseDouble(args[1]));
		cd2.print();
		
		System.out.println("\nParametarised(copy) Constructor");
		ConstDemo cd3=new ConstDemo(cd2);
		cd3.print();
	}
}
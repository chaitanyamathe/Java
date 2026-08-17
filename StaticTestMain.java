class StaticTest
{
	static int count;
	
	StaticTest()
	{
		count++;
	}
	
	static void display()
	{
		System.out.println("Count= "+count);
	}
}

class StaticTestMain
{
	static{
			System.out.println("Welcome to the world of One Piece");
	}
	public static void main(String args[])
	{
		StaticTest test1=new StaticTest();
		test1.display();   //StaticTest.display
		
		StaticTest test2=new StaticTest();
		test2.display();
		
		StaticTest test3=new StaticTest();
		test3.display();
	}
}//
class Constructor
{
	int key;
	
	
	Constructor(){
		key=24;
	}
	void print()
	{
		System.out.print("Key= "+key);
	}
	public static void main(String a[])
	{
		Constructor c=new Constructor();
		c.print();
	}
}
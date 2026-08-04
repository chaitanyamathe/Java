class Constructor
{
	int key;
	
	Constructor(int num){
		key=num;
	}
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
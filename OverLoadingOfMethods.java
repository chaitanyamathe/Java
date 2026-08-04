class OverLoadingOfMethods
{
	int sq;
	void display()
	{
		System.out.println("Number: "+sq);
	}
	void display(int sq)
	{
		int n=sq*sq;
		this.sq=sq;
		System.out.println("Number: "+this.sq);
		System.out.println("Square: "+n);
	}
	void display(OverLoadingOfMethods m)
	{
		this.sq=m.sq;
		System.out.println("Number: "+this.sq);
	}
	public static void main(String a[])
	{
		OverLoadingOfMethods m1=new OverLoadingOfMethods();
		m1.display();
		m1.display(20);
		OverLoadingOfMethods m2=new OverLoadingOfMethods();
		m2.display(m1);
	}
}
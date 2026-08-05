class VariableDemoo
{
	int instance_var;
	static double class_var;
	public static void main(String[] a)
	{
		int local_var;
		local_var=10;
		System.out.println("Local variable: "+instance_var);
		VariableDemo vd=new VariableDemo();
		System.out.println("Instance variable: "+instance_var);
		System.out.println("class variable: "+class_var);
	}
	void printVariable()
	{
		System.out.println("Local variable: "+local_var);
		System.out.println("Instance varable: "+instance_var);
		System.out.println("class variable: "+class_var);

	}
}
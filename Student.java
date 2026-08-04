import java.util.Scanner;

class Student
{
	String name;
	String rollno;
	String dept;
	int year;

	void readData()
	{
		Scanner scan=new Scanner(System.in);
		System.out.print("Enter Student info like Name, Roll.No, Dept, Year: ");
		name=scan.nextLine();
		rollno=scan.nextLine();
		dept=scan.nextLine();
		year=scan.nextInt();
	}
	void displayData()
	{
		System.out.print("Name: "+name+"\nRoll.No: "+rollno+"\nDept: "+dept+"\nYear: "+year);
	}
	public static void main(String a[])
	{
		Student s=new Student();
		s.readData();
		s.displayData();
	}
}
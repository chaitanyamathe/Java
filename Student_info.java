//Java program to demonstrate objects and classes

import java.util.Scanner;
class Student_info
{
 	//member variables declarations
 	String name;
 	String rollno;
 	String dept;
 	int year;

 	//method(member functions) definitions
 	void readData()
 	{
 		Scanner scan=new Scanner(System.in);
 		System.out.print("Enter Student Name, Roll no, Dept, Year:\n");
 		name=scan.nextLine();
 		rollno=scan.next();
 		dept=scan.nextLine();
 		year=scan.nextInt();
 	}
 	void display()
 	{
		System.out.print("Name: "+name+"\\nRoll.no: "+rollno+"\\nDept:"+dept+"\\nyear: "+year);
	}
	public static void main(String args[])
 	{
 		Student s=new Student;
 		s.readData();
 		s.displayData();
 	}
 
}
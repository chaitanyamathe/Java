import java.util.Scanner;
class ArrayEx2
{
	public static void main(String args[])
	{
		int[] a=new int[5];
		System.out.println("Array default values before initialization: ");
		Scanner scan=new Scanner(System.in);
                for(int i=0;i<5;i++)
		{
			System.out.println(i+" value of Array = "+a[i]);
		}
		int i=0;
		for(i=0;i<a.length;i++)
                  {
                   System.out.println("Enter Array "+(i+1)+" values: ");
			a[i]=scan.nextInt();
                  }
		System.out.println("Array vlaues after initialization: ");
		for(int j:a)       //Advanced for loop   HERE WE NOT INTILIZE THE J IF WE INTILZE IT TAKES AS NORMAL FOR---->for(;;) display error it expects ; insted of :
			System.out.println(j);
	}
	
}
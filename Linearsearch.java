package Arrays;
import java.util.Scanner;
import java.util.Arrays;

public class LinearSearch {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter the size of the array...");
		int n=sc.nextInt();
		
		int[] arr=new int[n];
		for(int i=0;i<arr.length;i++) {
			arr[i]=sc.nextInt();
			
		}
		Arrays.sort(arr);
		System.out.println(arr[arr.length-1]);
	}

}

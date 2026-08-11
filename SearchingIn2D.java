package arrays;

import java.util.Scanner;

public class SearchingIn2D {
	public static void main(String[] args0) {
		int a=7899778;
		System.out.println((int)Math.log10(a)+1);
		System.out.println((int)((Math.random()+1)*100000));//otp random number genrator
		Scanner sc=new Scanner(System.in);
	
		System.out.println("Enter a number that you want to check.Whether it is power of two or not..");
		int num=sc.nextInt();
		if((Math.log(num)/Math.log(2)%1==0)){//(num&(num-1))==0
			System.out.println("It is power of two..");
		}
		else {
			System.out.println("This is not a power of two..");
		}
		if((num&1)==0) {
			System.out.println("Yes it is even number");
		}
	}
	

}

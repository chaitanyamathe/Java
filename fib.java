import java.util.Scanner;
class Fib{
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int n1=0;
        int n2=1;
        int n3=0;
        
        while(n3<=n){
            System.out.print(n3);
            n3=n1+n2;
            n1=n2;
            n2=n3;
            
        }


    }
}


//0   1   1   2   3   4   7
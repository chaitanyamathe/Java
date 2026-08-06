import java.util.Scanner;
class Rev{
    public static void main(String args[]){
        int n=123223;
        int rem;
        int rev=0;
        while(n>=0){
            rem=n%10;
            rev=rev*10+rem;
            n=n/10;
        }
    }
}
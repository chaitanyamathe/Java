class Cmd_Line_Array{
public static void main(String args[]){
if(args.length>0)
{
for(int i=0;i<args.length;i++)
System.out.println(args[i]);
}
else
System.out.println("Missing command line values");
}
}
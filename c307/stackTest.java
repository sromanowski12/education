public class stackTest
{
    public static void main(String[] args)
    {
        AccountStack stack = new AccountStack();
            
        stack.push(1001, "Janet Mayer", 2000);
        stack.push(3003, "Lisa Smith", 1000);
        stack.push(2002, "May Bee", 1500);
            
            for (int i=0; i<4; i++)
            {
                AccountNode temp = stack.pop();
                if (temp !=null)
                {    
                    System.out.println(temp.name);
                }
            }

        return;
    }
}
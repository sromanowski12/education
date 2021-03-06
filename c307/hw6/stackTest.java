public class stackTest
{
    public static void main(String[] args)
    {
        AccountStack stack = new AccountStack();
            
        stack.push(1001, "Janet Mayer", 2000);
        stack.push(3003, "Lisa Smith", 1000);
        stack.push(2002, "May Bee", 1500);
        stack.push(6006, "Lisa Smith", 1000);
        stack.push(4004, "May Bee", 1500);
        stack.push(5005, "Lisa Smith", 1000);
        stack.push(7007, "May Bee", 1500);        
        

        for (int i=0; i<8; i++)
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
public class AccountList
{
    private node head;
    
    public AccountList()
    {
        this.head= null;
    }
    
    public void addFront(int n, String s, double b)
    {
        node newNode = new node(n, s, b);
        newNode.next = head;
        head = newNode;
    }
       
    public void listAll()
    {
        node temp = head;
        
        while(temp != null)
        {
            System.out.println(temp.account_number + " " + temp.name + " " + temp.balance);
            
            temp = temp.next;
        }
    }
    
    public boolean updateBalance(int act, double newb)
    {
        
        node temp = head;
        
        while(temp != null)
        {
            if(temp.account_number==act)
            {
                temp.balance = newb;
                return true;
            }
            
            else temp = temp.next;
        }   
        return false;
    }
    
    public void insert_in_order_balance(int n, String s, double b)
    {
        // your code goes here
        node temp = head;
        boolean isOrdered = false;
        
        if(temp == null)
        {
            addFront(n, s, b);
            isOrdered = true;
        }
        // else
        // {
        //     int firstValue = head.balance;
        //     if(b <= firstValue)
        //     {
        //         temp = head;
        //         addFront(n, s, b);
        //         head.next = temp;
        //         isOrdered = true;
        //     }
        //     else
        //     {
        //         temp = head;
        //         node t1 = head;
        //         node t2 = head.next;

        //         while(temp!=null)
        //         {
        //             if(b > t2.balance && t2 != null)
        //             {
        //                 t1 = t2;
                        
        //             }

        //             temp = temp.next;
        //         }
        //     }

        // }
    }
    
    public void remove(String name)
    {
        // your code goes here
    }
}

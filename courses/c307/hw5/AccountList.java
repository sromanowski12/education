// Seth Romanowski
// INFO-C307
// 2/28/21
// HW5 - class AccountList

public class AccountList
{
    private node head;
    
    public AccountList()
    {
        this.head= null;
    }
    
    public void addFront(int n, String s, int b)
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
    
    public boolean updateBalance(int act, int newb)
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
    
    public void insert_in_order_balance(int n, String s, int b)
    {
        if(head == null)
        {
            addFront(n, s, b);
        }
        else // list is not empty
        {
            if(b > head.balance)
            {
                node temp = head;
                addFront(n, s, b);
                head.next = temp;
                return;
            }
            else
            {
                node t1 = head;
                node t2 = t1.next;

                while(t2 != null)
                {
                    if(b <= t2.balance)
                    {
                        t1 = t2;
                        t2 = t1.next;
                    }
                    else
                    {
                        node temp2 = new node(n, s, b);
                        temp2.next = t2;
                        t1.next = temp2;
                        return;
                    }
                }

                node temp2 = new node(n, s, b);
                temp2.next = null;
                t1.next = temp2;
                return;
            }
        }
    }
    
    public void remove(String name)
    {
        if(head == null) return;

        else // list is not empty
        {
            node t1 = head;
            node t2 = t1.next;

            while(t2!=null)
            {
                if(t2.name == name) // node should be removed
                {
                    t2 = t2.next;
                    t1.next = t2;
                }
                else // node should be kept
                {
                    t1 = t2;
                    t2 = t1.next;
                }
            }

            // examine the first node

            if(head.name == name) // remove the first node
            {
                head = head.next;
            }
            
            // else do nothing: keep the first node
        }
    }

    public void removeSecond()
    {
        if(head == null || head.next == null) return;
        else {
            node t1 = head;
            node t2 = t1.next;
            if(t2.next == null)
            {
                t1.next = null;
            }
            else {
                node temp = t2.next;
                t1.next = temp;
            }
        }
    }
}

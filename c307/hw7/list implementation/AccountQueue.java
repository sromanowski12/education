// Seth Romanowski
// INFO-C307
// 3/21/21
// HW7 - class AccountQueue

public class AccountQueue
{
    private AccountNode qFront;
    private AccountNode qRear;

    public AccountQueue()
    {
        qFront = null;
        qRear = null; 
    }
        
    private boolean isEmpty()
    {
        if(qFront==null) return true;
	    else return false;
    }
    
    public void enqueue(int act_number, String name, double balance)
    {
        AccountNode n = new AccountNode (act_number, name, balance);
	
        if(isEmpty()==true)
        {
            qFront=qRear;
            qRear=n;
        }
        else
        {
            qRear.next = n;
            qRear = n;
        }
        
    }
	
    public AccountNode dequeue()
    {
        if(isEmpty()==false)
        {
            AccountNode temp = qFront;
            qFront = qFront.next;
            if(qFront==null)
            {
                qRear = null;
            }
            return temp;
        }
        else return null;
    }
}
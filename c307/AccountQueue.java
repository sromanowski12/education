public class AccountQueue
{
    private AccountNode[] myqueue;
    private int size;
    private int head;
    private int tail;
    private int current_size;

    public AccountQueue(int size)
    {
        // constructor
        // your code goes here
    }

    private boolean isFull()
    {
        if(current_size == size) return true;
	else return false;
    }
	
    private boolean isEmpty()
    {
    	if(current_size == 0) return true;
	else return false;    
    }
	
    public boolean enqueue(int account_number, String name, double balance)
    {
        AccountNode n = new AccountNode(account_number, name, balance);
        
        // enqueue, add AccountNode n to the back of the queue
        // your code goes here
        
        
    }
	
    public AccountNode dequeue()
    {
        if(isEmpty()==false)
	{

            // dequeue (remove and return the AccountNode in front of the queue
            // your code goes here
        
        
	}
	else return null;
    }
}
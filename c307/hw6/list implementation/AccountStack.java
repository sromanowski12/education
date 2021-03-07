// Seth Romanowski
// INFO-C307
// 3/7/21
// HW6 - class AccountStack
// Linked-list based stack implementation

public class AccountStack {
    private AccountNode top;

    public AccountStack()
    {
        top = null;
    }
	
    private boolean isEmpty()
    {
        if(top==null) return true;
	    else return false;
    }
	
    public void push(AccountNode n)
    {
        // your code goes here:
        // push AccountNode n to the top of stack 
        n.next = top;
        top = n;
    }
	
    public AccountNode pop()
    {
        // your code goes here:
        // return the data item at the top of stack
        // if stack is empty, retun null
        if(isEmpty()==true) return null;
        else
        {
            AccountNode n = top;
            top = top.next;
            n.next = null;
            return n;
        }
    }
}

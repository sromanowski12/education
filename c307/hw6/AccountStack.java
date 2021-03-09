public class AccountStack
{
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

    public void push(int v, String s, double b)
    {
        AccountNode n = new AccountNode(v, s, b);
        n.next = top;
        top = n;
    }

    public AccountNode pop()
    {
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
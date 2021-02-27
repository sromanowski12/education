public class node
{
    public int account_number;
    public String name;
    public double balance;
    
    public node next;
    
    public node(int account_number, String name, double balance)
    {
        this.name = name;
        this.account_number = account_number;
        this.balance = balance;
        
        this.next = null;
    }
    
}

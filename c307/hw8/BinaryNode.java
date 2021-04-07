public class BinaryNode
{
    public int account_number;
    public String name;
    public double balance;
    public BinaryNode left;
    public BinaryNode right;
    
    public BinaryNode(int account_number, String name, double balance)
    {
	    this.account_number = account_number;
        this.name = name;
        this.balance = balance;
        this.left = null;
        this.right = null;
    }
}

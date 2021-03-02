public class node
{
    public int account_number;
    public String name;
    public int balance;
    
    public int rule_id;
    public String rule_caption;
    public String rule_type;

    public node next;
    
    public node(int account_number, String name, int balance)
    {
        this.name = name;
        this.account_number = account_number;
        this.balance = balance;
        
        this.next = null;
    }
    public node(int rule_id, String rule_caption, String rule_type)
    {
        this.rule_id = rule_id;
        this.rule_caption = rule_caption;
        this.rule_type = rule_type;
        
        this.next = null;
    }
}

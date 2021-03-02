public class RuleList
{
    private node head;

    public RuleList()
    {

        head = null;
    }

    public void addFront(int r, String s1, String s2)
    {
        node newNode = new node(r, s1, s2);
        newNode.next = head;
        head = newNode;
    }
       
    public void listAll()
    {
        node temp = head;
        
        while(temp != null)
        {
            System.out.println(temp.rule_id + " " + temp.rule_caption + " " + temp.rule_type);
            
            temp = temp.next;
        }
    }

    public void insert_in_order_rule_id(int r, String c, String t)
    {
        if(head == null)
        {
            addFront(r, c, t);
            
        }
    }
}
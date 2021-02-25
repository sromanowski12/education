/* Seth Romanowski
   INFO-C307
   2-21-21
   HW4 - Class AccountList */

public class AccountList
{
    node head;

    AccountList()
    {
        head = null;
    }

    void insertNode(node n)
    {
        n.next = head;
        head = n;
    }

    void addFront(int v, String n, double b)
    {
        node newNode = new node(v, n, b);
        newNode.next = head;
        head = newNode;
    }

    void listAll()
    {
        node temp = head;

        while(temp!=null)
        {
            System.out.println(temp.account_number + " " + temp.name + " " + temp.balance);
            temp = temp.next;
        }
    }    

    boolean updateBalance(int act, double newb)
    {
        node temp = head;

        while(temp!=null)
        {
            if(temp.account_number == act)
            {
                temp.balance = newb;
                return true;
            }
            temp = temp.next;
        }
        return false;
    }
}
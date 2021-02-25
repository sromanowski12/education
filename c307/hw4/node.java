/* Seth Romanowski
   INFO-C307
   2-21-21
   HW4 - Class node */

public class node
{
    int account_number;
    String name;
    double balance;
    node next;
    
    node(int v1, String v2, double v3)
    {
        account_number = v1;
        name = v2;
        balance = v3;
        next = null;
    }
}
public class testList
{
    // public static void main(String[] args)
    // {    
    //     AccountList AL = new AccountList();
        
    //     AL.insert_in_order_balance(1001, "John Kelly", 2000);
    //     AL.insert_in_order_balance(3003, "Jane Smith", 100);
    //     AL.insert_in_order_balance(2002, "James Smith", 200);
    //     AL.insert_in_order_balance(4004, "John Smith", 1300);
       
    //     System.out.println("Before remove operation:");
    //     AL.listAll();  
    //     AL.remove("James Smith");
    //     System.out.println("\n After remove operation:");
    //     AL.listAll();
    // }
    public static void main(String[] args)
    {    
        // node temp1 = new node(1,"Seth",3.3);
        // String v1 = temp1.name;
        // System.out.println(v1);
        // System.out.println("\n After operation:");

        AccountList AL = new AccountList();
        
        AL.insert_in_order_balance(1001, "John Kelly", 2000);
     //   AL.addFront(1001, "John Kelly", 999.88);
     //   AL.addFront(3003, "Jane Smith", 100);
     //   AL.addFront(2002, "James Smith", 200);
     //   AL.addFront(4004, "John Smith", 1300);
       
        System.out.println("Before operation:");
        AL.listAll();  
     //   AL.updateBalance(1001, 2000);
        System.out.println("\n After operation:");
        AL.listAll();



    }
}
/*
if your classes are implemented correctly, you should see:

Before remove operation:
1001 John Kelly 2000.0
4004 John Smith 1300.0
2002 James Smith 200.0
3003 Jane Smith 100.0

 After remove operation:
1001 John Kelly 2000.0
4004 John Smith 1300.0
3003 Jane Smith 100.0
*/

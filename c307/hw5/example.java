public class example {
    public static void main(String[] args)
    {    
        // node temp1 = new node(1,"Seth",3.3);
        // String v1 = temp1.name;
        // System.out.println(v1);
        // System.out.println("\n After operation:");

        AccountList AL = new AccountList();
        
        AL.addFront(1001, "John Kelly", 999.88);
        AL.addFront(3003, "Jane Smith", 100);
        AL.addFront(2002, "James Smith", 200);
        AL.addFront(4004, "John Smith", 1300);
       
        System.out.println("Before operation:");
        AL.listAll();  
        AL.updateBalance(1001, 2000);
        System.out.println("\n After operation:");
        AL.listAll();



    }
}

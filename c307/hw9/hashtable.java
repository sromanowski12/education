// Seth Romanowski
// INFO-C307
// 4/3/21
// HW9 - class hashtable

// Assignment: build hash tables to store the account object
// -- int account_number, String name, double balance
// 1. Hash Table
// -- Must be dynamically allocated
// -- Constructor for the hash table should be able to accept an integer (n>=2) as a parameter & creates a hash table such that the size of the table is equal to the next prime number (N) which is greater than (n)
// 2. Hash Function: used to produce a semi-unique address for a given key to be stored in the hash table.
// -- *In this assignment, account_number and name are used together as a composite key
// -- Hash code map: (key --> integer) - account_number + summation of the ASCII values of each character in string name
// --- To cast a char C to an int j, you can use: int j = (int) C;
// -- Compression map: (integer --> [0, N-1]) - i = integer % N
// --- i is the index of the hash table the account will be hashed into
// 3. Collision Resolution: often multiple keys could hash into the same hash table locations. In such cases we must be able to deal with the collision.
// -- For this assignment, you are required to use chaining collision resolution w/ an unsorted linked list
// 4. 3 classes
// -- class account, class hashtable, class test
// 5. Constructor of the hashtable class
// -- Creates an array of size N
// 6. Structure of the hash table
// -- Each array index contains head to an unsorted linked list of account
// 7. hashtable class should support the following operations:
// -- void insert()
// -- void remove()
// -- account search()
// 8. Test

public class hashtable
{
    // change back to private
    public account[] array;
    // change back to private
    public int size;

	// hashtable Constructor - takes one parameter, int n
    public hashtable(int n)
    {      
        size = getPrime(n);
		array = new account[size];
		for (int i=0; i<size; i++)
		{
			array[i] = null; //create empty linkedlists
		}
    }
	
	// insert Function - 3 parameters: int act, String n, double b
    public void insert(int act, String n, double b)
    {        
        account temp = new account(act, n, b);
		int index = hash_code_map(act, n)%size;
		
		if(array[index] == null)
		{
				array[index] = temp;
		}
		else
		{
				temp.next = array[index];
				array[index] = temp;
		}
    }
    
	// remove Function - 
    public void remove(int act, String n)
    {
		// your code goes here
		// find the account and remove it from the hashtable.
		// do nothing if it can not be found
		int index = hash_code_map(act, n)%size;
		if(array[index] == null) return;
		else
		{
			account t1 = array[index];
			account t2 = t1.next;

			while(t2 != null)
			{
				if(t2.account_number == act)
				{
					t2 = t2.next;
					t1.next = t2;
				}
				else
				{
					t1 = t2;
					t2 = t1.next;
				}
			}

			if(array[index].account_number == act)
			{
				array[index] = array[index].next;
			}
		}
    }
	
	// search Function - 
    public account search(int act, String name)
    {
		// your code goes here
		// find the account and return it (the pointer).
		// retun null if it can not be found
		int index = hash_code_map(act, name)%size;
		account temp = array[index];
		if(temp != null)
		{	
			if(array[index].account_number == act)
			{
				return temp;
			}
			else
			{
				return null;
			}
		}
		else
		{
			return null;
		}

    }
    
	// getPrime Function - 
    private int getPrime(int n)
    {        
        boolean done=false;
		int i = n+1;

		while(done==false)
		{
			boolean prime = true;
			for(int j=2; j<i; j++)
			{
				if(i%j==0) prime=false;
			}
			if(prime==true)
			{
				done = true;
			}
			else i = i + 1;
		}

		return i;
    }
    
	// hash_code_map Function - 
    private int hash_code_map(int act, String name)
    {
    	int sum = 0;
		for(int i=0; i!=name.length(); i++)
		{
				sum = sum + (int)(name.charAt(i));
				//sum = sum + name.charAt(i); // this also works
		}
		return sum+act;
    }
}













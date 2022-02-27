// Seth Romanowski
// 3/28/21
// INFO-C307
// HW8 - class BinarySearchTree

public class BinarySearchTree
{
    private BinaryNode root;

    public BinarySearchTree()
    {
        root = null;
    }
	
    public void insert(int n, String m, double b)
    {
        root = insert_to_subtree(n, m, b, root);
    }
	
    public void remove(int n)
    {
        root = remove_from_subtree(n, root);
    }
	
    public boolean search(int n)
    {
        return search_subtree(root, n);
    }
	
    public void list_all()
    {
        list_subtree(root);
    }

    private BinaryNode insert_to_subtree(int n, String m, double b, BinaryNode t)
    {
        if(t == null)
        {
            t = new BinaryNode(n, m, b);
        }
        else if(n < t.account_number)
        {
            t.left = insert_to_subtree(n, m, b, t.left);
        }
        else if(n > t.account_number)
        {
            t.right = insert_to_subtree(n, m, b, t.right);
        }
        return t;
    }
	
    public BinaryNode remove_from_subtree(int n, BinaryNode t)
    {
      	if(t == null) return t;
        else if(n < t.account_number)
        {
            t.left = remove_from_subtree(n, t.left);
            return t;
        }
        else if(n > t.account_number)
        {
            t.right = remove_from_subtree(n, t.right);
            return t; 
        }
        else
        {
            if(t.left != null && t.right != null)
            {
                t.account_number = findMin(t.right).account_number;
                t.right = remove_from_subtree(t.account_number, t.right);
                return t;
            }
            else if(t.left != null)
            {
                return t.left;
            }
            else if(t.right != null)
            {
                return t.right;
            }
            else return null;
        }
    }
	
    private BinaryNode findMin(BinaryNode t)
    {
        if(t==null) return null;
        else
        {
            if(t.left == null) return t;
            else return findMin(t.left);
	    }
    }
	
    private boolean search_subtree(BinaryNode t, int n)
    {
        if(t==null) return false;
        else if(n<t.account_number) return search_subtree(t.left, n);
        else if(n>t.account_number) return search_subtree(t.right, n);
        else return true;
    }
    
    public void list_subtree(BinaryNode t)
    {
        if(t==null) return;
        list_subtree(t.left);
        System.out.println(t.account_number);
        list_subtree(t.right);
    }
}



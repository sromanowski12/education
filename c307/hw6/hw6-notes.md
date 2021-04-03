
Array-Based Stack Implementation

```java
public class IntegerStack
{
    private int[] mystack;
    private int size;
    private int current_index;

    public IntegerStack(int size)
    {
        mystack = new int[size];
        this.size = size;
        this.current_index = 0;
    }

    private boolean isFull()
    {
        if(current_index==size) return true;
        else return false;
    }

    private boolean isEmpty()
    {
        if(current_index==0) return true;
        else return false;
    }

    public boolean push(int value)
    {
        if(isFull()==false)
        {
            mystack[current_index]=value;
            current_index++;
            return true;
        }
        else
            return false;
    }
}
```

Linked List Based Stack Implementation

```java
// class node
public class node
{
    public int value;
    public node next;

    public node(int value)
    {
        this.value = value;
        this.next = null;
    }
}

// class IntegerStack
public class IntegerStack
{
    private node top;

    public IntegerStack()
    {
        top = null;
    }

    private boolean isEmpty()
    {
        if(top==null) return true;
        else return false;
    }

    public void push(int value)
    {
        node n = new node(value);
        n.next = top;
        top = n;
    }
}
```
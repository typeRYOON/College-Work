/* GenericQueue.java */

public class GenericQueue<T> extends GenericList<T>
{
    private Node<T> tail;  // Reference to last Node on GLL.

    // GenericQueue Constructor (T):
    public GenericQueue(T frontItem)
    {
        setHead(new Node(frontItem));
        setTail(getHead());
        setLength(1);
    }

    // GenericQueue Constructor (T, int):
    public GenericQueue(T frontItem, int code)
    {
        this(frontItem); // GenericQueue(T)
        getHead().code = code;
    }

    // Tail node setter / getter:
    public void setTail(Node<T> newTail) { tail = newTail; }
    public Node<T> getTail() { return tail; }

    // Add nodes to GLL, add parameter as new Node. (T)
    public void add(T data)
    {
        Node<T> newNode = new Node(data);
        setLength(getLength() + 1);

        // Case - Empty Queue:
        if (getHead() == null) {
            setHead(newNode);
        }
        else {
            tail.next = newNode;
        }
        setTail(newNode);
    }

    // Add nodes to GLL, add parameters as new Node. (T, int)
    public void add(T data, int code)
    {
        this.add(data);
        tail.code = code;
    }

    // Delete head node and return data field:
    public T delete()
    {
        int listLength = getLength();
        Node<T> dequeuedNode = getHead();

        // Case - Empty Queue:
        if (listLength <= 0) {
            return null;
        } 
        setLength(getLength() - 1);
        setHead(dequeuedNode.next);

        // Case - Queue size of 1 (head/tail := null):
        if (listLength == 1) {
            setTail(null);
        }
        return dequeuedNode.data;
    }

    // enqueue(..) / dequeue() == add(..) / delete():
    public void enqueue(T data) { this.add(data); }
    public void enqueue(T data, int code) { this.add(data, code); }
    public T dequeue() { return this.delete(); }
}
/* GenericList.java */
import java.util.ArrayList;
import java.util.Iterator;

public abstract class GenericList<T> implements Iterable<T>
{
    private Node<T> head;  // Reference to front Node of GLL.
    private int length;    // Number of nodes on GLL.k

    // Print to output console, GLL's node data:
    public void print()
    {   // Case - Empty List:
        if (length == 0) {
            System.out.println("Empty List");
            return;
        }
        Node<T> cur = head;
        while (cur != null) {
            System.out.println(cur.data);
            cur = cur.next;
        }
    }

    // To be implemented in subclasses:
    public abstract void add(T data);
    public abstract T delete();

    // Dump GLL's node data into an ArrayList<T>:
    public ArrayList<T> dumpList()
    {
        ArrayList<T> listDump = new ArrayList<T>();
        Node<T> cur = head;
        while (cur != null) {
            listDump.add(cur.data);
            cur = cur.next;
        }
        return listDump;
    }

    // Get ith node's data:
    public T get(int index)
    {
        Node<T> retNode = getIthNode(index);
        return retNode == null ? null : retNode.data;
    }

    // Replace ith node's data: 
    public T set(int index, T element)
    {
        Node<T> retNode = getIthNode(index);
        if (retNode == null) {
            return null;
        }
        T prevData = retNode.data;
        retNode.data = element;
        return prevData;
    }

    // Return ith node:
    private Node<T> getIthNode(int index)
    {
        if (index < 0 || index >= length) {
            return null;
        }
        Node<T> cur = head;
        for (int i = 0; i < index; i++) {
            cur = cur.next;
        }
        return cur;
    }

    // Getters:
    public int getLength() { return length; }
    public Node<T> getHead() { return head; }

    // Setters:
    public void setHead(Node<T> head) { this.head = head; }
    public void setLength(int length) { this.length = length; }

    // Iterators (front->back, back->front):
    public Iterator<T> iterator() { return new GLLIterator<T>(this); }
    public Iterator<T> descendingIterator() { return new ReverseGLLIterator<T>(this); }

    // Node<T> class to be used by GLL<T>:
    public class Node<T>
    {
        public Node<T> next;
        public int code;
        public T data;

        // Node<T> Constructor
        public Node(T data)
        {
            this.data = data;
            this.next = null;
        }
    }
}
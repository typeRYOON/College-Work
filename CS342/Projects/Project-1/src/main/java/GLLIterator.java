/* GLLIterator.java */
import java.util.ArrayList;
import java.util.Iterator;

public class GLLIterator<E> implements Iterator<E>
{
    private GenericList<E>.Node<E> cur;  // Current node in GLL.
    private GenericList<E> GLList;       // Passed GLL reference.

    // GLLIterator Constructor:
    public GLLIterator(GenericList<E> list)
    {
        cur = list.getHead();
        GLList = list;
    }

    // If cur == null, no more nodes to traverse:
    public boolean hasNext() { return cur != null; }

    // cur.next traverses cur forward:
    public E next()
    {
        if (!hasNext()) {
            throw new java.util.NoSuchElementException();
        }
        E data = cur.data;
        cur = cur.next;
        return data;
    }
}
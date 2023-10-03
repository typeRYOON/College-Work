/* ReverseGLLIterator.java */
import java.util.ArrayList;
import java.util.Iterator;

public class ReverseGLLIterator<E> implements Iterator<E>
{
    private ArrayList<GenericList<E>.Node<E>> refStack;  // List of node refs.
    private GenericList<E>.Node<E> cur;                  // Current node in GLL.
    private int i;                                       // Current index for refStack.

    // ReverseGLLIterator Constructor:
    public ReverseGLLIterator(GenericList<E> list)
    {
        refStack = new ArrayList<>(list.getLength());
        cur = list.getHead();

        // Add nodes to array.
        // Will be reversed through as we use iterator:
        while (cur != null) {
            refStack.add(cur);
            cur = cur.next;
        }
        i = refStack.size() - 1;  // Last index of refStack.
        if (i > -1) {             // Inverse Case - GLL size 0.
            cur = refStack.get(i);
        }
    }

    // refStack index < 0 mean no more nodes left.
    public boolean hasNext() { return i > -1; }

    // Get next node in refStack by reversing through ArrayList:
    public E next()
    {
        if (!hasNext()) {
            throw new java.util.NoSuchElementException();
        }
        E data = cur.data;
        if (--i > -1) {
            cur = refStack.get(i);
        }
        return data;
    }
}
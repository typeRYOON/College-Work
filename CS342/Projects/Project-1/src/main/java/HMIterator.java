/* HMIterator.java */
import java.util.ArrayList;
import java.util.Iterator;

public class HMIterator<E> implements Iterator<E>
{
    private GenericQueue<E>.Node<E> cur = null;  // Current node in GHM.
    private ArrayList<GenericQueue<E>> map;      // Reference to GHM's list of GQueues.
    private int queueIDX = -1;                   // Index of curQueue in map.

    // HMIterator Constructor:
    public HMIterator(MyHashMap<E> hashMap)
    {
        map = hashMap.getMap();
        findFrontNode();
    }

    // Iterate through Array of Queues until one exists:
    private void findFrontNode()
    {
        GenericQueue<E> curQueue;
        while (++queueIDX < 10) {
            curQueue = map.get(queueIDX);
            if (curQueue != null) {
                cur = curQueue.getHead();  // Next node found.
                return;
            }
        }
        // QueueIDX is out of range, no more nodes to traverse:
        cur = null;
    }

    // If cur == null, no more nodes to traverse:
    public boolean hasNext() { return cur != null; }

    // Iterate through queue, if null, attempt to find new queue:
    public E next()
    {
        if (!hasNext()) {
            throw new java.util.NoSuchElementException();
        }
        E data = cur.data;
        cur = cur.next;
        if (cur == null) {
            findFrontNode();
        }
        return data;
    }
}
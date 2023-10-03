/* MyHashMap.java */
import java.util.ArrayList;
import java.util.Iterator;

public class MyHashMap<T> implements Iterable<T>
{
    private ArrayList<GenericQueue<T>> map;  // ArrayList of Queues.
    private int keySize = 0;                 // Amount of keys in GHM.

    // MyHashMap Constructor:
    public MyHashMap(String key, T value)
    {   // Set up all queues to be null:
        map = new ArrayList<>(10);
        for (int i = 0; i < 10; ++i) {
            map.add(null);
        }
        put(key, value);
    }

    // Put key, value pair into HM, generate index based on hashCode:
    public void put(String key, T value)
    {
        int code = key.hashCode();
        int queueIDX = code & 0x9;
        GenericQueue<T> curQueue = map.get(queueIDX);

        // Case - Current queue is uninitialized:
        if (curQueue == null) {
            curQueue = new GenericQueue<T>(value, code);
            map.set(queueIDX, curQueue);
        } else {
            curQueue.add(value, code);
        }
        keySize += 1;
    }

    // Find node that matches hashCode of param key:
    private GenericList<T>.Node<T> lookUpKey(String key)
    {
        int code = key.hashCode();
        int queueIDX = code & 0x9;
        GenericQueue<T> curQueue = map.get(queueIDX);

        // Case - Index hashed is uninitialized:
        if (curQueue == null) return null;

        // Attempt to find node that matches hashCode:
        GenericList<T>.Node<T> cur = curQueue.getHead();
        while (cur != null) {
            if (cur.code == code) return cur;
            cur = cur.next;
        }
        return null;
    }

    // Check to see if param key matches any node's hashes:
    public boolean contains(String key) { return lookUpKey(key) != null; }

    // Return param key's value pair if it exists, else null:
    public T get(String key)
    {
        GenericList<T>.Node<T> retNode = lookUpKey(key);
        return retNode == null ? null : retNode.data;
    }

    // Replace param key's value pair if it exists, return old value:
    public T replace(String key, T value)
    {
        GenericList<T>.Node<T> retNode = lookUpKey(key);
        if (retNode == null) {
            return null;
        }
        T retData = retNode.data;
        retNode.data = value; 
        return retData;
    }

    // MyHashMap key amount getter:
    public int size() { return keySize; }

    // Key size == 0 boolean getter:
    public boolean isEmpty() { return keySize == 0; }

    // MyHashMap key, value ArrayList map getter:
    public ArrayList<GenericQueue<T>> getMap() { return map; }

    // MyHashMap specific Iterator:
    public Iterator<T> iterator() { return new HMIterator<T>(this); }
}
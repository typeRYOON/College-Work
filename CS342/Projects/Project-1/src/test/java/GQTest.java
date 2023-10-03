/* GQTest.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import java.util.ArrayList;
import java.util.Iterator;

class GQTests
{
    static GenericQueue<Integer> GQ1;
    static GenericQueue<Integer> GQ2;
    static Integer[] expected = {111, 10, 20, 30, 40, 50};

    @BeforeEach
    void GQSetUp()
    {
        GQ1 = new GenericQueue<>(111);     // T frontItem.
        GQ2 = new GenericQueue<>(112, 5);  // T frontItem, int code.
    }

    // Helper function to add some integers:
    void addFiveIntegers(GenericQueue<Integer> GQ)
    {
        GQ.add(10, 1);
        GQ.add(20, 2);
        GQ.add(30, 3);
        GQ.add(40, 4);
        GQ.add(50, 5);
    }

    @Test
    void GQConstructorTest()
    {   // frontItem Check from constructor:
        assertEquals(111, GQ1.getHead().data);
        assertEquals(112, GQ2.getHead().data);

        // Initial Size check:
        assertEquals(1, GQ1.getLength());
        assertEquals(1, GQ2.getLength());

        // Head and Tail nodes should be equal:
        assertEquals(GQ1.getHead(), GQ1.getTail());
        assertEquals(GQ2.getHead(), GQ2.getTail());

        // 2nd constructor should set code field:
        assertEquals(5, GQ2.getHead().code);
    }

    @Test
    void NodeConstructorTest()
    {
        GenericList<Integer>.Node<Integer> Node1 = new GenericQueue<Integer>(null).new Node<Integer>(11);

        // Check constructor values:
        assertEquals(11, Node1.data);
        assertEquals(0, Node1.code);
        assertNull(Node1.next);
    }

    @Test
    void AddTest()
    {   // GenericQueue :: add()
        // Retrieve current tail and add a new node:
        GenericList<Integer>.Node<Integer> Node1 = GQ1.getTail();
        GenericList<Integer>.Node<Integer> Node2 = GQ1.getHead();
        GQ1.add(10);

        assertNotEquals(Node1, GQ1.getTail());  // Tail field should be changed.
        assertEquals(10, GQ1.getTail().data);   // New value present.
        assertEquals(Node1, GQ1.getHead());     // Head should not have changed.
        assertEquals(2, GQ1.getLength());       // Length change.
    }

    @Test
    void DeleteTest()
    {   // GenericQueue :: delete()
        int ret;
        addFiveIntegers(GQ1);
        assertEquals(6, GQ1.getLength());

        ret = GQ1.delete();
        assertEquals(111, ret);            // Head node's value.
        assertEquals(5, GQ1.getLength());  // Changed length.

        // Remove all but one node:
        for (int i = 1; i < 5; ++i) {
            ret = GQ1.delete();
            assertEquals(i*10, ret);
            assertEquals(5-i, GQ1.getLength());
        }

        // Head and tail values should be equal:
        assertEquals(GQ1.getHead(), GQ1.getTail());
        assertNotNull(GQ1.getHead());

        ret = GQ1.delete();
        assertEquals(50, ret);
        assertEquals(0, GQ1.getLength());

        // List should now be empty:
        assertNull(GQ1.delete());
        assertEquals(0, GQ1.getLength());
    }

    @Test
    void EnqueueTest()
    {   // GenericQueue :: enqueue()
        // Retrieve current tail and add a new node:
        GenericList<Integer>.Node<Integer> Node1 = GQ1.getTail();
        GenericList<Integer>.Node<Integer> Node2 = GQ1.getHead();
        GQ1.enqueue(10);

        assertNotEquals(Node1, GQ1.getTail());  // Tail field should be changed.
        assertEquals(10, GQ1.getTail().data);   // New value present.
        assertEquals(Node1, GQ1.getHead());     // Head should not have changed.
        assertEquals(2, GQ1.getLength());       // Length change.
    }

    @Test
    void DequeueTest()
    {   // GenericQueue :: dequeue()
        int ret;
        addFiveIntegers(GQ1);
        assertEquals(6, GQ1.getLength());

        ret = GQ1.dequeue();
        assertEquals(111, ret);            // Head node's value.
        assertEquals(5, GQ1.getLength());  // Changed length.

        // Remove all but one node:
        for (int i = 1; i < 5; ++i) {
            ret = GQ1.dequeue();
            assertEquals(i*10, ret);
            assertEquals(5-i, GQ1.getLength());
        }

        // Head and tail values should be equal:
        assertEquals(GQ1.getHead(), GQ1.getTail());
        assertNotNull(GQ1.getHead());

        ret = GQ1.dequeue();
        assertEquals(50, ret);
        assertEquals(0, GQ1.getLength());

        // List should now be empty:
        assertNull(GQ1.dequeue());
        assertEquals(0, GQ1.getLength());
    }

    @Test
    void DumpListTest()
    {   // GenericList :: dumpList()
        addFiveIntegers(GQ1);
        ArrayList<Integer> ret = GQ1.dumpList();

        assertEquals(expected.length, ret.size());
        for (int i = 0; i < expected.length; ++i) {
            assertEquals(expected[i], ret.get(i));
        }

        // Empty Queue:
        GQ2.delete();
        assertEquals(0, GQ2.getLength());

        ret = GQ2.dumpList();
        assertEquals(0, ret.size());
    }

    @Test
    void GetTest()
    {   // GenericList :: get()
        addFiveIntegers(GQ1);  // 0-5 indices possible.

        // Out of bounds:
        assertNull(GQ1.get(-1));
        assertNull(GQ1.get(6));

        // Case - Head node get:
        assertEquals(expected[0], GQ1.get(0));

        // Case - Middle nodes get:
        for (int i = 1; i < 5; ++i) {
            assertEquals(expected[i], GQ1.get(i));
        }

        // Case - Tail node get:
        assertEquals(expected[5], GQ1.get(5));
        assertEquals(GQ1.getTail().data, GQ1.get(5));
    }

    @Test
    void SetTest()
    {   // GenericList :: set()
        addFiveIntegers(GQ1);  // 0-5 indices possible.

        // Out of bounds:
        assertNull(GQ1.set(-1, 10));
        assertNull(GQ1.set(6, 100));

        // Case - Head node set:
        assertEquals(expected[0], GQ1.set(0, 0));

        // Case - Middle nodes set:
        for (int i = 1; i < 5; ++i) {
            assertEquals(expected[i], GQ1.set(i, i));
        }

        // Case - Tail node set:
        assertEquals(expected[5], GQ1.set(5, 5));

        // Check that nodes' data have been replaced with their index:
        int expectedInt = 0;
        for (int element : GQ1) {
            assertEquals(expectedInt, element);
            ++expectedInt;
        }
    }

    @Test
    void GetLengthTest()
    {   // GenericList :: getLength()
        assertEquals(1, GQ1.getLength());

        // add() length changes:
        addFiveIntegers(GQ1);
        assertEquals(6, GQ1.getLength());

        for (int i = 0; i < 100; ++i) {
            GQ1.add(i);
            assertEquals(7 + i, GQ1.getLength());
        }

        // delete() length changes:
        GQ1.delete();
        assertEquals(105, GQ1.getLength());

        for (int i = 0; i < 105; ++i) {
            GQ1.delete();
            assertEquals(104 - i, GQ1.getLength());
        }

        // Empty Queue:
        assertEquals(0, GQ1.getLength());
    }

    @Test
    void GetHeadTest()
    {   // GenericList :: getHead()
        GenericList<Integer>.Node<Integer> r = GQ1.getHead();
        assertEquals(expected[0], r.data);
        assertNull(r.next);

        // Adding new nodes should not change head node:
        addFiveIntegers(GQ1);
        assertNotNull(r.next);
        assertEquals(r, GQ1.getHead());
        assertEquals(expected[1], r.next.data);
    }
    
    @Test 
    void SetLengthTest()
    {   // GenericList :: setLength()
        assertEquals(1, GQ1.getLength());

        // Set length to multiple values:
        GQ1.setLength(100);
        assertEquals(100, GQ1.getLength());

        GQ1.setLength(-10);
        assertEquals(-10, GQ1.getLength());

        GQ1.setLength(1);
        assertEquals(1, GQ1.getLength());
    }

    @Test
    void SetHeadTest()
    {   // GenericList :: setHead()
        GenericList<Integer>.Node<Integer> oldH = GQ1.getHead();
        GenericList<Integer>.Node<Integer> newH = new GenericQueue<Integer>(null).new Node<Integer>(100);
        assertNotEquals(oldH, newH);

        // Validate change:
        GQ1.setHead(newH);
        assertEquals(newH, GQ1.getHead());
        assertNotEquals(oldH, GQ1.getHead());
    }

    @Test
    void GLLIteratorTest()
    {   // GLLIterator:
        addFiveIntegers(GQ1);
        Iterator<Integer> it = GQ1.iterator();

        // Check both loop types work:
        int i = 0;
        for (int element : GQ1) {
            assertEquals(expected[i++], element);
        }
        assertEquals(6, GQ1.getLength());

        i = 0;
        while (it.hasNext()) {
            assertEquals(expected[i++], it.next());
        }
        assertEquals(6, GQ1.getLength());
    }

    @Test
    void ReverseGLLIteratorTest()
    {   // descendingIterator:
        addFiveIntegers(GQ1);
        Iterator<Integer> it = GQ1.descendingIterator();

        // Check foreach loop work:
        int i = GQ1.getLength() - 1;
        while (it.hasNext()) {
            assertEquals(expected[i--], it.next());
        }
        assertEquals(-1, i);
    }
}
/* HMTest.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import java.util.ArrayList;
import java.util.Iterator;

class HMTests
{
    static MyHashMap<Integer> HM1;
    static String[] keys = {"Test",
                            "Test_xFx^1",
                            "Test_x3ds1",
                            "Test_DSF2@",
                            "Test_DSAFs",
                            "Test_Po^ds"};

    @BeforeEach
    void GQSetUp() { HM1 = new MyHashMap<>("Test", 111); }

    void addFiveValues(MyHashMap<Integer> HM)
    {
        HM.put("Test_xFx^1", 1);
        HM.put("Test_x3ds1", 2);
        HM.put("Test_DSF2@", 3);
        HM.put("Test_DSAFs", 4);
        HM.put("Test_Po^ds", 5);
    }

    @Test
    void HMConstructorTest()
    {   // Default constructor values check:
        ArrayList<GenericQueue<Integer>> HM1_Map = HM1.getMap();

        assertEquals(1, HM1.size());
        assertEquals(10, HM1_Map.size());

        // Make sure str "TestA" was inserted into correct queue:
        int code = "Test".hashCode();
        int index = code & 0x9;

        assertNotNull(HM1_Map.get(index));
        assertEquals(code, HM1_Map.get(index).getHead().code);

        // Make sure all other queues are null:
        for (int i = 0; i < 10; ++i) {
            if (i == index) continue;
            assertNull(HM1_Map.get(i));
        }
    }

    @Test
    void PutTest()
    {   // MyHashMap :: put()
        ArrayList<GenericQueue<Integer>> HM1_Map = HM1.getMap();

        assertEquals(1, HM1.size());
        assertEquals(10, HM1_Map.size());

        // Place 5 values and check that those keys exist:
        addFiveValues(HM1);
        for (int i = 1, index; i < 6; ++i) {
            index = keys[i].hashCode() & 0x9;
            assertNotNull(HM1_Map.get(index));  // Queue exists from hash index.
            assertTrue(HM1.contains(keys[i]));  // Key pairs to hash code
            assertEquals(i, HM1.get(keys[i]));  // Key pairs to put value.
        }
    }

    @Test
    void ContainsTest()
    {   // MyHashMap :: contains()
        addFiveValues(HM1);

        // Check some keys that do not exist in HM1.
        assertFalse(HM1.contains("test"));
        assertFalse(HM1.contains("Ryan Magdaleno"));
        assertFalse(HM1.contains("Mark Hallenbeck"));
        assertFalse(HM1.contains("CS342"));
        assertFalse(HM1.contains("Test_x3ds1 "));
        assertFalse(HM1.contains(" Test_x3ds1"));
        assertFalse(HM1.contains(" Test_x3ds1 "));

        // Check keys that do exist:
        for (int i = 0; i < 6; ++i) {
            assertTrue(HM1.contains(keys[i]));
        }
    }

    @Test
    void GetTest()
    {   // MyHashMap :: get()
        addFiveValues(HM1);  // Only values = {111, [1, 5]}

        // Using get() with not-existant keys returns null:
        assertNull(HM1.get("test"));
        assertNull(HM1.get("Ryan Magdaleno"));
        assertNull(HM1.get("Mark Hallenbeck"));
        assertNull(HM1.get("CS342"));
        assertNull(HM1.get("Test_x3ds1 "));
        assertNull(HM1.get(" Test_x3ds1"));
        assertNull(HM1.get(" Test_x3ds1 "));

        // Get values that do exist:
        for (int i = 0, ret; i < 6; ++i) {
            ret = HM1.get(keys[i]);
            assertTrue((ret < 6 && ret > 0) || ret == 111);
        }
    }

    @Test
    void ReplaceTest()
    {   // MyHashMap :: replace()
        addFiveValues(HM1);

        // replace() on non-existant keys returns null:
        assertNull(HM1.replace("test", 0));
        assertNull(HM1.replace("Ryan Magdaleno", 0));
        assertNull(HM1.replace("Mark Hallenbeck", 0));
        assertNull(HM1.replace("CS342", 0));
        assertNull(HM1.replace("Test_x3ds1 ", 0));
        assertNull(HM1.replace(" Test_x3ds1", 0));
        assertNull(HM1.replace(" Test_x3ds1 ", 0));

        // Replace all values with [100-105] range of integers:
        for (int i = 0, ret; i < 6; ++i) {
            ret = HM1.replace(keys[i], i + 100);
            assertTrue((ret < 6 && ret > 0) || ret == 111);
        }

        // Validate change:
        int amount = 0;
        for (int element : HM1) {
            assertTrue(element >= 100 && element <= 105);
            ++amount;
        }
        assertEquals(HM1.size(), amount);
    }

    @Test
    void IsEmptyTest()
    {   // Impossible for isEmpty() to be true, no delete for HMs.
        assertFalse(HM1.isEmpty());

        addFiveValues(HM1);
        assertFalse(HM1.isEmpty());
    }

    @Test
    void HMIteratorTest()
    {   // HMIterator:
        addFiveValues(HM1);

        int i = 0;
        for (int element : HM1) {
            ++i;
        }
        assertEquals(6, i);  // 6 nodes traversed.
        assertEquals(HM1.size(), i);
    }
}
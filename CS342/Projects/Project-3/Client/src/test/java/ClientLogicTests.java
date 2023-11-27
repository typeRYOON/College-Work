/* ClientTests.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

// Class for testing parts of the ClientGUI/Logic and DataPacket class ::              - -
class ClientTests
{
    // Public version of toDigit ::                                                    - -
    public int toDigit(String str)
    {
        if (str == null || str.length() == 0) { return -1; }
        try { return Integer.parseInt(str); }
        catch (NumberFormatException e) { return -1; }
    }

    // Public version of replaceAtIndices ::                                           - -
    public String replaceAtIndices(String src, ArrayList<Integer> LI, char letter)
    {
        char[] charArray = src.toCharArray();
        for (int i = 0; i < LI.size(); ++i) {
            charArray[LI.get(i)] = letter;
        }
        return new String(charArray);
    }

    // toDigit Test 1 ::                                                       TEST-01 - -
    @Test
    void toDigitTest1()
    {
        assertEquals(-1, toDigit("asd"));
        assertEquals(-1, toDigit("123 "));
        assertEquals(-1, toDigit("@"));
        assertEquals(-1, toDigit("342."));
    }

    // toDigit Test 2 ::                                                       TEST-02 - -
    @Test
    void toDigitTest2()
    {
        assertEquals(123, toDigit("123"));
        assertEquals(0, toDigit("0"));
        assertEquals(5555, toDigit("5555"));
        assertEquals(342, toDigit("342"));
    }

    // Test the constructor containers being intialized:                       TEST-03 - -
    @Test
    void ClientLogicConstructerTest()
    {
        ArrayList<Integer> catWordsLeft = new ArrayList<>(3);
        ArrayList<Boolean> chosenCats = new ArrayList<>(3);
        Map<Character, Boolean> charMap = new HashMap<>();

        for (char c = 'a'; c <= 'z'; c++) charMap.put(c, false);
        for (int i = 0; i < 3; ++i) chosenCats.add(false);
        for (int i = 0; i < 3; ++i) catWordsLeft.add(3);

        for (char c = 'a'; c <= 'z'; c++) {
            assertFalse(charMap.get(c));
        }
        for (int i = 0; i < 3; ++i) { assertFalse(chosenCats.get(i)); }
        for (int i = 0; i < 3; ++i) { assertEquals(3, catWordsLeft.get(i)); }
    }

    // replaceAtIndices Test 1 ::                                              TEST-04 - -
    @Test
    void replaceAtIndicesTest1()
    {
        ArrayList<Integer> LI = new ArrayList<>();
        LI.add(1);
        LI.add(2);

        assertEquals("pooper", replaceAtIndices("p__per", LI, 'o'));
    }

    // replaceAtIndices Test 2 ::                                              TEST-05 - -
    @Test
    void replaceAtIndicesTest2()
    {
        ArrayList<Integer> LI = new ArrayList<>();
        LI.add(0);
        LI.add(1);
        LI.add(2);
        LI.add(4);
        LI.add(5);
        LI.add(6);

        assertEquals("aaa_aaa", replaceAtIndices("_______", LI, 'a'));
    }

    // replaceAtIndices Test 3 ::                                              TEST-06 - -
    @Test
    void replaceAtIndicesTest3()
    {
        ArrayList<Integer> LI = new ArrayList<>();
        LI.add(5);

        assertEquals("h__burger", replaceAtIndices("h__bu_ger", LI, 'r'));
    }

    // DataPacket Test 1 ::                                                    TEST-07 - -
    @Test
    void DataPacketConstructTest1()
    {
        DataPacket tester = new DataPacket(0xFF, 0x03);
        assertEquals(0xFF, tester.requestCode);
        assertEquals(0x03, tester.category);
    }

    // DataPacket Test 2 ::                                                    TEST-08 - -
    @Test
    void DataPacketConstructTest2()
    {
        DataPacket tester = new DataPacket(0x01, 0x02, 'z');
        assertEquals('z', tester.guessedLetter);
        assertEquals(0x01, tester.requestCode);
        assertEquals(0x02, tester.category);
    }

    // DataPacket Test 3 ::                                                    TEST-09 - -
    @Test
    void DataPacketConstructTest3()
    {
        DataPacket tester = new DataPacket(0x00, 0x00, 'a');
        assertEquals('a', tester.guessedLetter);
        assertEquals(0x00, tester.requestCode);
        assertEquals(0x00, tester.category);

        tester.setMessage("CS342-Project-3");
        assertEquals("CS342-Project-3", tester.logMessage);
    }

    // DataPacket Test 4 ::                                                    TEST-10 - -
    @Test
    void DataPacketConstructTest4()
    {
        DataPacket tester = new DataPacket(0x00, 0x00, 'a');
        assertEquals('a', tester.guessedLetter);
        assertEquals(0x00, tester.requestCode);
        assertEquals(0x00, tester.category);

        ArrayList<Integer> LI = new ArrayList<>();
        for (int i = 1; i <= 45; ++i) { LI.add(i); }
        tester.setArray(new ArrayList<>(LI));

        for (int i = 1; i <= 45; ++i) {
            assertEquals(i, tester.letterIndices.get(i-1));
        }
    }
}
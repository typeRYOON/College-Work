/* CardTests.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

// Class for testing the src\main\java\Card class:
class CardTests
{
    static Card cardA;
    static Card cardB;
    static Card cardC;

	@BeforeAll
    static void CardConstructor()
    {
        cardA = new Card("Diamond", 2);  // 2 of Diamonds.
        cardB = new Card("Heart", 10);   // Jack of Hearts.
        cardC = new Card("Club", 1);     // Ace of Clubs.
    }

    @Test
    void constructorTest()
    {   // Default constructor values check:
        assertEquals("Diamond", cardA.suite);
        assertEquals("Heart", cardB.suite);
        assertEquals("Club", cardC.suite);

        assertEquals(2, cardA.value);
        assertEquals(10, cardB.value);
        assertEquals(1, cardC.value);
    }
}
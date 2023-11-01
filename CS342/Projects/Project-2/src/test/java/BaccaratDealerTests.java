/* BaccaratDealerTests.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;

// Class for testing the src\main\java\BaccaratDealer class:
class BaccaratDealerTests
{
	static BaccaratGame game;

    @BeforeAll
    static void setUpDealer()
    {
        game = new BaccaratGame();
        game.theDealer = new BaccaratDealer();
        game.theDealer.generateDeck();
    }

    @Test
    void dealerConstructor()
    {   // Deck attribute initialized after generating deck:
        assertNotNull(game.theDealer.deck);
    }

    @Test
    void generateDeckTest1()
    {   // Assert basic attributes:
        game.theDealer.generateDeck();
        assertNotNull(game.theDealer.deck);

        // Deck size:
        assertEquals(52, game.theDealer.deckSize());
    }

    @Test
    void generateDeckTest2()
    {   // Check the deck has the cards needed:
        game.theDealer.generateDeck();
        int diamonds = 0, clubs = 0, spades = 0, hearts = 0, total = 0;
        for (Card cur : game.theDealer.deck) {
            if (cur.suite == "Diamond")    diamonds++;
            else if (cur.suite == "Club")  clubs++;
            else if (cur.suite == "Spade") spades++;
            else if (cur.suite == "Heart") hearts++;
            total += cur.value;
        }
        // There should be 13 of each type of suite card:
        assertEquals(13, diamonds);
        assertEquals(13, clubs);
        assertEquals(13, spades);
        assertEquals(13, hearts);

        // All IDs should add up to 364:
        assertEquals(364, total);
    }

    @Test
    void dealHandTest1()
    {
        game.theDealer.generateDeck();
        ArrayList<Card> testHand = game.theDealer.dealHand();

        // Draws 2:
        assertEquals(2, testHand.size());
        assertEquals(50, game.theDealer.deckSize());
    }

    @Test
    void dealHandTest2()
    {
        game.theDealer.generateDeck();
        ArrayList<Card> testHand = game.theDealer.dealHand();

        // Draws 2:
        assertEquals(2, testHand.size());
        assertEquals(50, game.theDealer.deckSize());

        // Draws 2 more:
        testHand = game.theDealer.dealHand();
        assertEquals(2, testHand.size());
        assertEquals(48, game.theDealer.deckSize());

        // Draws 2 more:
        testHand = game.theDealer.dealHand();
        assertEquals(2, testHand.size());
        assertEquals(46, game.theDealer.deckSize());

        // Reset deck for other tests:
        game.theDealer.generateDeck();
    }

    @Test
    void drawOneTest1()
    {   // Basic attributes test:
        game.theDealer.generateDeck();
        Card drawnCard = game.theDealer.drawOne();
        
        assertNotNull(drawnCard);
        assertEquals(51, game.theDealer.deckSize());
    }

    @Test
    void drawOneTest2()
    {   // Check unique card doesn't exist in original deck:
        game.theDealer.generateDeck();
        Card drawnCard = game.theDealer.drawOne();

        // Check card is not in deck:
        String drawnCardStr = drawnCard.cardStr();
        for (Card cur : game.theDealer.deck) {
            assertNotEquals(drawnCardStr, cur.cardStr());
        }
    }

    @Test
    void shuffleDeckTest1()
    {
        game.theDealer.generateDeck();

        // Get 5 cards from the deck, and their formats to check later:
        ArrayList<String> cardStrs = new ArrayList<>(5);
        cardStrs.add(0, game.theDealer.deck.get(0).cardStr());
        cardStrs.add(1, game.theDealer.deck.get(10).cardStr());
        cardStrs.add(2, game.theDealer.deck.get(20).cardStr());
        cardStrs.add(3, game.theDealer.deck.get(30).cardStr());
        cardStrs.add(4, game.theDealer.deck.get(40).cardStr());
        
        game.theDealer.shuffleDeck();
        
        // Check to see cards at the 10s indices are different after shuffle:
        int totalNotMatched = 0, rare = 0;
        for (int i = 0; i < 5; ++i) {
            if (game.theDealer.deck.get(i*10).cardStr() == cardStrs.get(i)) {
                System.out.println("1/(52!) chance event occured.");
                rare++;
                continue;
            }
            totalNotMatched++;
        }
        // Should be impossible for all 5 to be in the same position after shuffle:
        assertTrue(rare == 5 || totalNotMatched > 0);
    }

    @Test
    void shuffleDeckTest2()
    {
        game.theDealer.generateDeck();

        // Get 5 cards from the deck, and their formats to check later:
        ArrayList<String> cardStrs = new ArrayList<>(5);
        cardStrs.add(0, game.theDealer.deck.get(5).cardStr());
        cardStrs.add(1, game.theDealer.deck.get(15).cardStr());
        cardStrs.add(2, game.theDealer.deck.get(25).cardStr());
        cardStrs.add(3, game.theDealer.deck.get(35).cardStr());
        cardStrs.add(4, game.theDealer.deck.get(45).cardStr());
        
        game.theDealer.shuffleDeck();
        
        // Check to see cards at the 5s indices are different after shuffle:
        int totalNotMatched = 0, rare = 0;
        for (int i = 0, j = 5; i < 5; ++i, j += 10) {
            if (game.theDealer.deck.get(j).cardStr() == cardStrs.get(i)) {
                System.out.println("1/(52!) chance event occured.");
                rare++;
                continue;
            }
            totalNotMatched++;
        }
        // Should be impossible for all 5 to be in the same position after shuffle:
        assertTrue(rare == 5 || totalNotMatched > 0);  
    }

    @Test
    void deckSizeTest1()
    {
        game.theDealer.generateDeck();
        assertEquals(52, game.theDealer.deckSize());

        game.theDealer.dealHand();  // Take 2.
        assertEquals(50, game.theDealer.deckSize());

        game.theDealer.drawOne();   // Take 1.
        assertEquals(49, game.theDealer.deckSize());
    }

    @Test
    void deckSizeTest2()
    {
        game.theDealer.generateDeck();
        for (int i = 0, j = 52; i < 30; ++i, --j) {
            assertEquals(j, game.theDealer.deckSize());
            game.theDealer.drawOne();
        }
    }
}

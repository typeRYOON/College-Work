/* BaccaratGameLogicTests.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;

// Class for testing the src\main\java\BaccaratGameLogic class:
class BaccaratGameLogicTests
{
    static BaccaratGame game;
    
	@BeforeAll
	static void setUp()
    {
        game = new BaccaratGame();
        game.gameLogic = new BaccaratGameLogic();
	}
    
    @Test
    void gameLogicConstructorTest() { assertNotNull(game.gameLogic); }
    
    @Test
    void whoWonTest1()
    {   // Player wins:
        ArrayList<Card> testHandP, testHandB;
        Card cardP, cardB;
        testHandP = new ArrayList<>(1);
        testHandB = new ArrayList<>(1);
        cardP = new Card("", 0);
        cardB = new Card("", 0);
        cardP.gValue = 8;
        cardB.gValue = 7;
        testHandP.add(0, cardP);
        testHandB.add(0, cardB);

        // Player: 8 > Banker: 7, Player wins:
        assertEquals("Player", game.gameLogic.whoWon(testHandP, testHandB));
        
        // Banker wins:
        testHandB.get(0).gValue = 9;
        
        // Player: 8 < Banker: 9, Banker wins:
        assertEquals("Banker", game.gameLogic.whoWon(testHandP, testHandB));
        
        // Draw occurs:
        testHandP.get(0).gValue = 9;
        
        // Player: 9 == Banker: 9, Draw:
        assertEquals("Draw", game.gameLogic.whoWon(testHandP, testHandB));
    }
    
    @Test
    void whoWonTest2()
    {   // Test null ArrayLists:
        
        // Player: 0 == Banker: 0, Draw:
        assertEquals("Draw", game.gameLogic.whoWon(null, null));
    }

    @Test
    void handTotalTest1()
    {   // Count game values (not > 9):
        ArrayList<Card> testHand = new ArrayList<>(2);
        Card test1 = new Card("", 0), test2 = new Card("", 0);
        test1.gValue = 3;
        test2.gValue = 3;
        testHand.add(0, test1);
        testHand.add(1, test2);

        // 3 + 3 = 6, 6 % 10 = 6
        assertEquals(6, game.gameLogic.handTotal(testHand));
    }

    @Test
    void handTotalTest2()
    {   // Count game values (not > 9):
        ArrayList<Card> testHand = new ArrayList<>(2);
        Card test1 = new Card("", 0), test2 = new Card("", 0);
        test1.gValue = 9;
        test2.gValue = 9;
        testHand.add(0, test1);
        testHand.add(1, test2);

        // 9 + 9 = 18, 18 % 10 = 8
        assertEquals(8, game.gameLogic.handTotal(testHand));
    }

    @Test
    void evaluateBankerDrawTest1()
    {   // Null player card tests:
        ArrayList<Card> testHand = new ArrayList<>(1);
        Card bCard = new Card("", 0);
        testHand.add(0, bCard);
        
        // 4 <= 5, true:
        bCard.gValue = 4;
        assertTrue(game.gameLogic.evaluateBankerDraw(testHand, null));
        
        // 6 <= 5, false:
        bCard.gValue = 6;
        assertFalse(game.gameLogic.evaluateBankerDraw(testHand, null)); 
    }

    @Test
    void evaluateBankerDrawTest2()
    {   // Check remaining cases:
        Card pCard = new Card("", 0), bCard = new Card("", 0);
        ArrayList<Card> testHand = new ArrayList<>(1);
        testHand.add(0, bCard);
        
        // bankerVal >= 7, false:
        bCard.gValue = 7;
        assertFalse(game.gameLogic.evaluateBankerDraw(testHand, pCard));
        
        // bankerVal <= 2, true:
        bCard.gValue = 2;
        assertTrue(game.gameLogic.evaluateBankerDraw(testHand, pCard));
        
        // bankerVal == 3, playerVal == 8, false, else true (on pVal != 8):
        bCard.gValue = 3;
        pCard.gValue = 8;
        assertFalse(game.gameLogic.evaluateBankerDraw(testHand, pCard));
        
        pCard.gValue = 2;
        assertTrue(game.gameLogic.evaluateBankerDraw(testHand, pCard));
        
        // Possible bankerVals are 4, 5, 6 here:
        // bankerVal == 4, playerVal >= 2, true
        bCard.gValue = 4;
        assertTrue(game.gameLogic.evaluateBankerDraw(testHand, pCard));
        
        // bankerVal == 5, playerVal >= 4, true
        bCard.gValue = 5;
        pCard.gValue = 4;
        assertTrue(game.gameLogic.evaluateBankerDraw(testHand, pCard));
        
        // bankerVal == 6, playerVal >= 6, true
        bCard.gValue = 6;
        pCard.gValue = 6;
        assertTrue(game.gameLogic.evaluateBankerDraw(testHand, pCard));
    }

    @Test
    void evaluatePlayerDrawTest1()
    {   // No draw test:
        ArrayList<Card> testHand = new ArrayList<>(2);
        Card test1 = new Card("", 0), test2 = new Card("", 0);
        test1.gValue = 3;
        test2.gValue = 3;

        // Hand = 3 + 3 = 6, no draw:
        testHand.add(0, test1);
        testHand.add(1, test2);
        assertFalse(game.gameLogic.evaluatePlayerDraw(testHand));
    }

    @Test
    void evaluatePlayerDrawTest2()
    {   // Draw card test:
        ArrayList<Card> testHand = new ArrayList<>(2);
        Card test1 = new Card("", 0), test2 = new Card("", 0);
        test1.gValue = 3;
        test2.gValue = 1;

        // Hand = 3 + 1 = 4, draw:
        testHand.add(0, test1);
        testHand.add(1, test2);
        assertTrue(game.gameLogic.evaluatePlayerDraw(testHand));
    }
}
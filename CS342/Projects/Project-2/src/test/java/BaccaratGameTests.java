/* BaccaratGameTests.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;

// Class for testing the src\main\java\BaccaratGame class:
class BaccaratGameTests
{
    static BaccaratGame game;

    @BeforeAll
    static void setUp() { game = new BaccaratGame(); }

    @Test
    void constructorTest()
    {   // Data fields checks:
        assertNull(game.playerHand);
        assertNull(game.bankerHand);
        assertNull(game.betWinner);
        assertNotNull(game.gameLogic);
        assertNotNull(game.theDealer);
        assertEquals(0.0, game.currentBet);
        assertEquals(0.0, game.totalWinnings);
        assertEquals("None", game.betPlacedOn);
    }

    @Test
    void evaluateWinningsTest1()
    {   // Players wins:
        game.currentBet = 10.0;
        game.betPlacedOn = "Player";
        game.betWinner = "Player";
        assertEquals(20.0, game.evaluateWinnings());

        // Banker wins:
        game.currentBet = 10.0;
        game.betPlacedOn = "Banker";
        game.betWinner = "Banker";
        assertEquals(19.5, game.evaluateWinnings());

        // Draw wins:
        game.currentBet = 10.0;
        game.betPlacedOn = "Draw";
        game.betWinner = "Draw";
        assertEquals(90.0, game.evaluateWinnings());

        game.betPlacedOn = null;
        game.betWinner = null;
    }

    @Test
    void evaluateWinningsTest2()
    {   // Player loses, negative bet rewarded:
        game.currentBet = 10.0;
        game.betPlacedOn = "Player";
        game.betWinner = "Draw";
        assertEquals(-10.0, game.evaluateWinnings());

        game.betPlacedOn = null;
        game.betWinner = null;
    }
}
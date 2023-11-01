/* BaccaratGameLogic.java */
import java.util.ArrayList;

class BaccaratGameLogic
{
    /** whoWon:                                                                        - -
    This function takes two Card hands and returns a string based on who won.
    - -                                                                                - -
        @param hand1  : The player Card hand.
        @param hand2  : The banker Card hand.
        @return String: The outcome of the two hands.                                   */
    public String whoWon(ArrayList<Card> hand1, ArrayList<Card> hand2)
    {
        int playerVal = handTotal(hand1), bankerVal = handTotal(hand2);
        if (playerVal == bankerVal) return "Draw";
        return playerVal > bankerVal ? "Player" : "Banker";
    }


    /** handTotal:                                                                     - -
    This function takes a Card hand and calculates the game value of said hand.
        - -                                                                            - -
        @param hand: The given Card hand.
        @return int: The given Card hand's game value total.                            */
    public int handTotal(ArrayList<Card> hand)
    {
        int total = 0;
        if (hand == null) return total;
        for (Card handCard : hand) {
            total += handCard.gValue;
        }
        return total % 10;
    }


    /** evaluateBankerDraw:                                                            - -
    This function evaluates a banker hand and decides on whether to allow the banker
    to draw another card. If the player drew an extra card then that will affect the
    whether the banker should draw an extra card.
        - -                                                                            - -
        @param hand      : The banker Card hand.
        @param playerCard: The extra drawn player card.
        @return boolean  : T/F, banker should draw an extra card.                       */
    public boolean evaluateBankerDraw(ArrayList<Card> hand, Card playerCard)
    {
        int bankerVal = handTotal(hand), playerVal;
        if (playerCard == null) return bankerVal <= 5;  // Player didn't draw.
        if (bankerVal >= 7) return false;           // Row 7, 8, 9 = NG.
        if (bankerVal <= 2) return true;            // Row 0, 1, 2.

        playerVal = playerCard.gValue;
        if (bankerVal == 3) return playerVal != 8;  // Row 3.

        if (playerVal >= 8) return false;           // Player 8, 9 = NG.
        if (bankerVal == 4) return playerVal >= 2;  // Row 4.
        if (bankerVal == 5) return playerVal >= 4;  // Row 5
        return playerVal >= 6;                      // Row 6.
    }


    /** evaluatePlayerDraw:                                                            - -
    This function decides whether the player should draw an extra card.
        - -                                                                            - -
        @param hand    : The player Card hand.
        @return boolean: T/F, player should draw an extra card.*/
    public boolean evaluatePlayerDraw(ArrayList<Card> hand)
    {
        return handTotal(hand) < 6;
    }
}   //                                                                                 - -
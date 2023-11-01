/* BaccaratDealer.java */
import java.util.Collections;
import java.util.ArrayList;
import java.util.Random;

class BaccaratDealer
{   // Deck data field:                                                                - -
    ArrayList<Card> deck;

    // Generate a standard 52 deck of cards:                                           - -
    public void generateDeck()
    {   // Generate Initial Cards with suite/id:
        deck = new ArrayList<Card>(52);
        for (int i = 1, j = 0; i < 14; ++i, j += 4) {
            deck.add(j, new Card("Diamond", i));
            deck.add(j + 1, new Card("Heart", i));
            deck.add(j + 2, new Card("Club", i));
            deck.add(j + 3, new Card("Spade", i));
        }

        // Set gameValues:
        for (int i = 40; i < 52; ++i) deck.get(i).gValue = 0;
        for (int i = 0, j = 1; i < 40; i += 4, ++j) {
            deck.get(i).gValue = j;
            deck.get(i + 1).gValue = j;
            deck.get(i + 2).gValue = j;
            deck.get(i + 3).gValue = j;
        }
        shuffleDeck();
    }

    // Deal an ArrayList of two random Cards:                                          - -
    public ArrayList<Card> dealHand()
    {
        ArrayList<Card> dealtHand = new ArrayList<>(2);
        Random random = new Random();
        for (int i = 0; i < 2; ++i) {
            dealtHand.add(i, deck.remove(random.nextInt(deck.size())));
        }
        return dealtHand;
    }

    // Return a single random Card from deck:                                          - -
    public Card drawOne()
    {
        if (deck.size() == 0) return null;
        Random random = new Random();
        return deck.remove(random.nextInt(deck.size()));
    }

    // Shuffle the deck ArrayList:                                                     - -
    public void shuffleDeck() { Collections.shuffle(deck); }

    // Deck size getter function:                                                      - -
    public int deckSize() { return deck.size(); }
}   //                                                                                 - -
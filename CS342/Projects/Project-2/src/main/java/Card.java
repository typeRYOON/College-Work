/* Card.java */

class Card
{   // Card data fields:                                                               - -
    String suite;
    int gValue;
    int value;

    // Card Constructor:                                                               - -
    Card(String theSuite, int theValue)
    {
        suite = theSuite;
        value = theValue;
    }

    // Card string formater:                                                           - -
    public String cardStr()
    {
        String ret = "";
        if (value == 1) {
            ret += "Ace";
        } else if (value == 11) {
            ret += "Jack";
        } else if (value == 12) {
            ret += "King";
        } else if (value == 13) {
            ret += "Queen";
        } else {
            ret += value;
        }
        return "\n" + ret + " of " + suite + "s";
    }
}   //                                                                                 - -
/* DataPacket.java */
import java.io.Serializable;
import java.util.ArrayList;

// DataPacket class for passing data between Client and Server ::                      - -
public class DataPacket implements Serializable
{
    // All possible attributes ::                                                      - -
    public int requestCode, wordSize, category;
    public ArrayList<Integer> letterIndices;
    public char guessedLetter;
    public String logMessage;

    // RequestCode and Category DataPacket Constructor ::                              - -
    public DataPacket(int requestCode, int category)
    {
        this.requestCode = requestCode;
        this.category = category;
    }

    // RequestCode, Category, and GuessedLetter DataPacket Constructor ::              - -
    public DataPacket(int requestCode, int category, char guessedLetter)
    {
        this.guessedLetter = guessedLetter;
        this.requestCode = requestCode;
        this.category = category;
    }

    // Set the letterIndices attribute ::                                              - -
    public void setArray(ArrayList<Integer> LI) { letterIndices = LI; }

    // Set the logMessage attribute ::                                                 - -
    public void setMessage(String msg) { logMessage = msg; }
}
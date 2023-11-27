/* ClientHandler.java */
import javafx.scene.control.TextArea;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.io.IOException;
import java.util.Random;
import java.net.Socket;

// Class that handles client packets and returns a response:                           - -
class ClientHandler implements Runnable
{
    // GUI Related ::                                                                  - -
    private TextArea consoleLog;

    // Server related ::                                                               - -
    private ObjectOutputStream outputStream;
    private ObjectInputStream inputStream;
    private DataPacket inputPacket;
    private Socket clientSocket;

    // Game related ::                                                                 - -
    private int correctLettersSoFar, currentWordLen, charLives, correctGuesses;
    private ArrayList<ArrayList<String>> words = new ArrayList<>();
    private ArrayList<Integer> letterIndices = new ArrayList<>();
    private ArrayList<Integer> wordsLeft = new ArrayList<>();
    private String currentWord, clientStr;

    /** setUpWords ::                                                                  - -
    Sets word arrays to their defaults, used at start of game cycle and on game resets.
        - -                                                                             */
    private void setUpWords()
    {
        // Each category starts with a count of 3 words:
        wordsLeft.clear();
        for (int i = 0; i < 3; ++i) { wordsLeft.add(3); }

        // Add solution words to check against:
        ArrayList<String> temp;
        words.clear();

        // Animals ::                                                                  - -
        temp = new ArrayList<>();
        temp.add("cat");
        temp.add("cow");
        temp.add("dog");
        words.add(temp);

        // Food ::                                                                     - -
        temp = new ArrayList<>();
        temp.add("milk");
        temp.add("pear");
        temp.add("honey");
        words.add(temp);

        // Hardware ::                                                                 - -
        temp = new ArrayList<>();
        temp.add("cpu");
        temp.add("psu");
        temp.add("ram");
        words.add(temp);
    }

    /** ClientHandler ::                                                               - -
    This constructer sets up the client socket to use in communication with the server.
    Sets up the stream objects and other starting attributes.
        - -                                                                            - -
        @param clientSocket  : Reference to clientSocket, used to close connection.
        @param consoleLog    : Reference to ServerGUI consoleLog object.
        @param clientNum     : Used in creating the clientStr for consoleLog.
        @return ClientHandler: New instance of ClientHandler.
        - -                                                                             */
    public ClientHandler(Socket clientSocket, TextArea consoleLog, int clientNum)
    {
        setUpWords();
        this.consoleLog = consoleLog;
        clientStr = "\n[Client " + clientNum + "] ";
        correctLettersSoFar = 0;
        correctGuesses = 0;
        try {
            this.clientSocket = clientSocket;
            outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
            inputStream = new ObjectInputStream(clientSocket.getInputStream());
        }   catch (IOException e) { closeAll(); }
    }

    /** checkLetter ::                                                                 - -
    Checks the letter against the current word, if the letter matches that indices
    letter, then add that index to letterIndices, which will be sent to the Client.
    This function checks if the user fully guessed currentWord here.
        - -                                                                            - -
        @param letter: The char the user guessed and sent.
        @return int  : A int representing a code for furthur program execution:
            - -                                                                        - -
            0x01 = No letters in currentWord matched.
            0x02 = Some letters matched on passed char.
            0x03 = Client fully guessed currentWord.
            - -                                                                         */
    private int checkLetter(char letter)
    {
        letterIndices.clear();
        for (int i = 0; i < currentWord.length(); ++i) {
            if (currentWord.charAt(i) == letter) { letterIndices.add(i); }
        }
        correctLettersSoFar += letterIndices.size();
        if (correctLettersSoFar == currentWordLen) { return 0x03; }
        return letterIndices.isEmpty() ? 0x01 : 0x02;
    }

    /** closeAll ::                                                                    - -
    Closes client socket and associated object streams.
        - -                                                                             */
    private void closeAll()
    {
        try {
            consoleLog.appendText(clientStr + "Terminated.");
            if (clientSocket != null) { clientSocket.close(); }
            if (outputStream != null) { outputStream.close(); }
            if (inputStream  != null) { inputStream.close() ; }
        }   catch (IOException e) {}
    }

    /** getRandomWord ::                                                               - -
    Picks a random word from the words ArrayList. 
        - -                                                                            - -
        @param category: The word category the Client user chose.
        - -                                                                             */
    private void getRandomWord(int category)
    {
        Random random = new Random();
        int randomNum = random.nextInt(words.get(category).size());
        currentWord = words.get(category).get(randomNum);
        currentWordLen = currentWord.length();
        words.get(category).remove(randomNum);
    }

    /** wordSizePacket ::                                                              - -
    Picks a random word and creates a packet to send to the client which only contains
    the request code 0x00 and the wordSize attribute set within the outgoing DataPacket.
        - -                                                                             */
    private DataPacket wordSizePacket()
    {
        DataPacket outputPacket = new DataPacket(0x00, inputPacket.category);
        getRandomWord(inputPacket.category - 1);
        outputPacket.wordSize = currentWordLen;
        charLives = 6;

        consoleLog.appendText(clientStr + "Category "
        + inputPacket.category + " word chosen: " + currentWord +  ".");
        outputPacket.setMessage("Your word is " + currentWordLen + " chars long.\n" + 
                                "Please guess a char.\n\n" +
                                "You have 6 char guesses remaining.");
        return outputPacket;
    }

    /** fullyGuessedWord ::                                                            - -
    Whenever the client correctly guesses a word, increment how many correct words the
    user has guessed and if 3 correct guesses have been made, then the win condition has
    been met.
        - -                                                                            - -
        @param outputPacket: The packet we are responding to the Client with.
        - -                                                                             */
    private void fullyGuessedWord(DataPacket outputPacket)
    {
        correctLettersSoFar = 0;
        consoleLog.appendText(clientStr + "Fully guessed word.");
        if (++correctGuesses == 3) {
            consoleLog.appendText(clientStr + "Won game.");
            correctGuesses = 0;
        }
        outputPacket.setMessage("You fully guessed the word: ");
    }

    /** lostAllGuesses ::                                                              - -
    Whenever the Client runs out of character lives, we send a message back to the Client
    GUI that the user lost on that category and to pick a new word.
        - -                                                                            - -
        @param outputPacket: The packet we are responding to the Client with.
        - -                                                                             */
    private void lostAllGuesses(DataPacket outputPacket)
    {
        correctLettersSoFar = 0;
        int wordCount = wordsLeft.get(inputPacket.category - 1) - 1;
        wordsLeft.set(inputPacket.category - 1, wordCount);

        consoleLog.appendText(clientStr + "Ran out of guesses.");
        if (wordCount == 0) { consoleLog.appendText(clientStr + "Lost game."); }

        outputPacket.setMessage("You ran out of guesses...\n\n" +
                                "Please select a category for a new word to guess.");
    }

    /** checkLetterPacket ::                                                           - -
    This function checks what the client's guessed letter is and depending on whether
    the user won/lost or to continue the game, the Server will send back the correct
    DataPacket with the correct ClientGUI message. Never sends the solution word.
        - -                                                                             */
    private DataPacket checkLetterPacket()
    {
        int letterCode = checkLetter(inputPacket.guessedLetter);
        if (letterCode == 0x1) { this.charLives -= 1; }  // Wrong guess.
        if (this.charLives == 0) { letterCode = 0x4; }   // Ran out of guesses.

        // Stage outputPacket contents:
        DataPacket outputPacket = new DataPacket(letterCode, inputPacket.category);
        outputPacket.letterIndices = new ArrayList<>(this.letterIndices);
        outputPacket.guessedLetter = inputPacket.guessedLetter;

        String outputPacketStr = String.format("""
            Your word is %d chars long.
            Please guess a char.\n
            You have %d char guesses remaining.""", currentWordLen, charLives);
        consoleLog.appendText(clientStr + "Guessed: " + inputPacket.guessedLetter + ".");

        switch (letterCode)
        {
            case 0x1 -> { outputPacket.setMessage(outputPacketStr); }
            case 0x2 -> { outputPacket.setMessage(outputPacketStr); }
            case 0x3 -> { fullyGuessedWord(outputPacket); }
            case 0x4 -> { lostAllGuesses(outputPacket)  ; }
        };
        return outputPacket;
    }

    /** resetGamePacket ::                                                             - -
    Send to Client the message that the game has been reset, which is the starting rules.
    Resets the word ArrayLists and correctGuesses back to 0.
    - -                                                                                 */
    private DataPacket resetGamePacket()
    {
        DataPacket outputPacket = new DataPacket(0xFF, 0xFF);
        consoleLog.appendText(clientStr + "Reset game.");
        setUpWords();
        correctGuesses = 0;
        outputPacket.setMessage("Rules:\n" +
            "1. This is a word guessing game similar to Wheel of Fortune.\n" +
            "2. You must successfully guess 3 words from 3 different categories.\n" +
            "3. You will have 6 char guesses allowed, correct guesses don't lower it.\n" +
            "4. On picking a category you will only be give the size of the word.\n" +
            "5. You are only allowed to guess a single character at a time.\n" +
            "6. You will lose the game if you guess 3 wrong words in 1 category.\n" +
            "7. As soon as you're ready to send a guess press the Send button.\n\n" +
            "Please select a category to start.");
        return outputPacket;
    }

    /** inputPacketHandler ::                                                          - -
    This function enters in the correct function depending on the client's request code.
    Returns the correct response packet to write to outputStream.
        - -                                                                             */
    private DataPacket inputPacketHandler()
    {
        DataPacket outputPacket = switch (inputPacket.requestCode)
        {
            case 0x00 -> { yield wordSizePacket()   ; }  // Client requests a new word.
            case 0x01 -> { yield checkLetterPacket(); }  // Client guessed a char.
            case 0xFF -> { yield resetGamePacket()  ; }  // Client wants to reset.
            default   ->
            {
                System.out.println("Error: Invalid request code passed.");
                yield null;
            }
        };
        return outputPacket;
    }

    /** run ::                                                                         - -
    This function runs on its own thread and reads/writes packets from this object's
    object streams.
        - -                                                                             */
    @Override
    public void run()
    {
        try {
            while (true) {
                inputPacket = (DataPacket) inputStream.readObject();
                outputStream.writeObject(inputPacketHandler());
            }
        }
        catch (IOException e) {}
        catch (ClassNotFoundException f) {}
        closeAll();
    }
}
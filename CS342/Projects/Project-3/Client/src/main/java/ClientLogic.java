/* ClientLogic.java */
import javafx.scene.control.TextField;
import javafx.scene.control.TextArea;
import javafx.scene.control.Button;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.util.Collections;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.net.Socket;
import java.util.Map;

// Class for handling Server packets ::                                                - -
public class ClientLogic
{
    // GUI related ::                                                                  - -
    private ClientGUI clientGUI;
    private TextField inputField;
    private TextArea gameArea;
    private Button sendInput;
    private Button resetButton;

    // Server related ::                                                               - -
    private ObjectOutputStream outputStream;
    private ObjectInputStream inputStream;
    private DataPacket inputPacket;
    private Socket clientSocket;

    // Game related ::                                                                 - -
    private ArrayList<Integer> catWordsLeft = new ArrayList<>(3);
    private ArrayList<Boolean> chosenCats = new ArrayList<>(3);
    private Map<Character, Boolean> charMap = new HashMap<>();
    private ArrayList<Button> catButtons = new ArrayList<>(3);
    private int correctWords;
    public String wordSoFar;
    private int category;

    /** ClientLogic ::                                                                 - -
    Constuctor for this class, sets passed attributes to own private attributes.
    Also sets up the object streams and client socket.
        - -                                                                            - -
        @param clientGUI   : Reference to clientGUI, used to exit GUI from this object.
        @param portNumber  : Port number to be used by Client.
        @return ClientLogic: New instance of ClientLogic.
        - -                                                                             */
    public ClientLogic(ClientGUI clientGUI, int portNumber)
    {
        try {
            clientSocket = new Socket("127.0.0.1", portNumber);
            outputStream = new ObjectOutputStream(clientSocket.getOutputStream());
            inputStream = new ObjectInputStream(clientSocket.getInputStream());
            System.out.println("Client connected to Server.");
        }
        catch (IOException e) {
            System.out.println("Error: Invalid port connection.");
            clientGUI.guiExit();
        }
        correctWords = 0;
        for (char c = 'a'; c <= 'z'; c++) { charMap.put(c, false); }
        for (int i = 0; i < 3; ++i)       { chosenCats.add(false); }
        for (int i = 0; i < 3; ++i)       { catWordsLeft.add(3)  ; }
        this.clientGUI = clientGUI;
    }

    /** linkAttributes ::                                                              - -
    Links ClientGUI elements to this object, for easier GUI changes.
        - -                                                                            - -
        @param inputField : TextField inputField from ClientGUI.
        @param resetButton: Button resetButton from ClientGUI.
        @param gameArea   : TextArea gameArea from ClientGUI.
        @param sendInput  : Button sendInput from ClientGUI.
        @param cat1       : Button animals from ClientGUI.
        @param cat2       : Button food from ClientGUI.
        @param cat3       : Button hardware from ClientGUI.
        - -                                                                             */
    public void linkAttributes(TextField inputField,
                               Button resetButton,
                               TextArea gameArea,
                               Button sendInput,
                               Button cat1,
                               Button cat2,
                               Button cat3)
    {
        this.resetButton = resetButton;
        this.inputField = inputField;
        this.sendInput = sendInput;
        this.gameArea = gameArea;
        catButtons.add(cat1);
        catButtons.add(cat2);
        catButtons.add(cat3);
    }

    /** closeAll ::                                                                    - -
    Closes client socket and associated object streams, closes the GUI as well.
        - -                                                                            - -
        @param msg: The message to print on termination.
        - -                                                                             */
    public void closeAll(String msg)
    {
        System.out.println(msg);
        try {
            if (outputStream != null) { outputStream.close(); }
            if (inputStream != null)  { inputStream.close() ; }
            if (clientSocket != null) { clientSocket.close(); }
        }   catch (IOException e) {}
        clientGUI.guiExit();
    }

    /** categoryClick ::                                                               - -
    Whenever the user presses a category button, request the Server for a random word's
    size from the requested category.
        - -                                                                            - -
        @param category: The word category the user pressed.
        - -                                                                             */
    public void categoryClick(int category)
    {
        // Disable category buttons:
        this.chosenCats.set(category - 1, true);
        for (int i = 0; i < 3; ++i) { catButtons.get(i).setDisable(true); }

        // Enable input field/button:
        inputField.setEditable(true);
        sendInput.setDisable(false);

        // 0x00 = Requesting new word and only its size from Server:
        inputPacket = sendPacket(new DataPacket(0x00, category));
        wordSoFar = String.join("", Collections.nCopies(inputPacket.wordSize, "_"));
        gameArea.appendText("\nYour word so far: " + wordSoFar);

        this.category = category;
    }

    /** sendPacket ::                                                                  - -
    Sends packet to the object stream and expects a response packet from the Server.
        - -                                                                            - -
        @param packet     : The outgoing DataPacket.
        @return DataPacket: The received response DataPacket.
        - -                                                                             */
    private DataPacket sendPacket(DataPacket packet)
    {
        DataPacket responsePacket = new DataPacket(0, 0);  // Default
        inputField.setEditable(true);
        sendInput.setDisable(false);
        try {
            outputStream.writeObject(packet);
            responsePacket = (DataPacket) inputStream.readObject();
            gameArea.setText(responsePacket.logMessage);
        }
        catch (IOException e) { closeAll("Closed connection due to IO error."); }
        catch (ClassNotFoundException x) { 
            closeAll("Closed connection due to ClassNotFoundException error.");
        }
        return responsePacket;
    }

    /** resetGame ::                                                                   - -
    Reset attributes of game to their defaults.
        - -                                                                             */
    public void resetGame()
    {
        sendPacket(new DataPacket(0xFF, 0xFF));  // Reset game on Server side.
        for (int i = 0; i < 3; ++i) {
            chosenCats.set(i, false);
            catWordsLeft.set(i, 3);
        }
        correctWords = 0;
        categoryButtonEnable();
    }

    /** categoryButtonEnable ::                                                        - -
    Enable the category buttons, but only if they haven't been pressed in the current
    game. If the user fails to guess a word that category will also be enabled again.
        - -                                                                             */
    private void categoryButtonEnable()
    {
        for (char c = 'a'; c <= 'z'; c++) { charMap.put(c, false); }
        for (int i = 0; i < 3; ++i) {
            if (chosenCats.get(i) == false) { catButtons.get(i).setDisable(false); }
        }
    }

    /** replaceAtIndices ::                                                            - -
    Replace a string's chars at the LI's indices, replacing chars with the passed char.
    Ex: src = "a__l_", LI = {1, 2}, letter = 'p', returns -> "appl_"
        - -                                                                            - -
        @param src    : String to replace at the LI indices.
        @param LI     : The letter indices from the inputPacket.
        @param letter : The character to replace the '_' with.
        @return String: The src string with the replaced chars.
        - -                                                                             */
    private String replaceAtIndices(String src, ArrayList<Integer> LI, char letter)
    {
        char[] charArray = src.toCharArray();
        for (int i = 0; i < LI.size(); ++i) {
            charArray[LI.get(i)] = letter;
        }
        return new String(charArray);
    }

    /** letterResultTextSet ::                                                         - -
    Set the GUI with the correct text depeneding on what the Client picked as their
    letter guess.
        - -                                                                             */
    public int letterResultTextSet()
    {
        this.wordSoFar = replaceAtIndices(wordSoFar,
                                          inputPacket.letterIndices,
                                          inputPacket.guessedLetter);
        switch (inputPacket.requestCode)
        {
            case 0x01 -> { gameArea.appendText("\nYour word so far: " + wordSoFar); }
            case 0x02 -> { gameArea.appendText("\nYour word so far: " + wordSoFar); }
            case 0x03 -> {
                if (++correctWords == 3) { return 0x05; }  // Game won.

                gameArea.appendText(wordSoFar + "\nPlease guess " + (3 - correctWords) +
                " more words in the remaining categories.\n\nPlease select a category.");
                categoryButtonEnable();
            }
            case 0x04 -> {
                int wordsLeft = catWordsLeft.get(this.category - 1) - 1;
                catWordsLeft.set(this.category - 1, wordsLeft);
                if (wordsLeft == 0) { return 0x06; }

                categoryButtonEnable();
                catButtons.get(this.category - 1).setDisable(false);
                chosenCats.set(this.category - 1, false);
            }
        }
        return inputPacket.requestCode;
    }

    // Public functions to interact with charMap:
    public boolean checkChar(char chr) { return charMap.get(chr); }
    public void setCharTrue (char chr) { charMap.put(chr, true); }

    /** inputClick ::                                                                  - -
    Whenever a user sends their char guess, send guess to Server to compare against the
    solution word, sends back correct code depending on what the user guessed.
        - -                                                                             */
    public void inputClick()
    {
        String text = inputField.getText();
        if (text.length() != 1) {
            inputField.setText("Only a single letter.");
            return;
        }
        if (!text.matches("[a-zA-Z]")) {
            inputField.setText("Only english letters.");
            return;
        }
        char charGuess = Character.toLowerCase(text.charAt(0));
        if (checkChar(charGuess) == true) {
            inputField.setText("Already guessed letter: " + charGuess + ".");
            return;
        }
        setCharTrue(charGuess);
        inputPacket = sendPacket(new DataPacket(0x01, this.category, charGuess));

        int finalRequestCode = letterResultTextSet();
        if (finalRequestCode >= 0x03 && finalRequestCode <= 0x06)
        {
            if (finalRequestCode == 0x5) {
                gameArea.setText("You've won the game!\n\n" +
                                 "Press the reset button to play again.");
                resetButton.setDisable(false);
            }
            else if (finalRequestCode == 0x6) {
                gameArea.setText("You've fully lost, GAMEOVER.\n\n" +
                                 "Press the reset button to play again.");
                resetButton.setDisable(false);
            }
            inputField.setEditable(false);
            sendInput.setDisable(true);
        }
        inputField.setText("");
    }
}
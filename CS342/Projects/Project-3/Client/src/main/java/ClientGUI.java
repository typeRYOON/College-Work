/* Client.java */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Mark Hallenbeck.
 >> University of Illinois Chicago - CS 342, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> Program :: Project-3: Multi-threaded Server and Client w/ GUI
 >> Course  :: CS 342 (37162), FA23
 >> Author  :: Ryan Magdaleno (rmagd2)
 >> System  :: JDK 20 using Apache Maven
 - -                                 - -
 >> Reference for background image:
 >> Artist  :: 七五三懸
 >> Title   :: 初春 猫の恋
 >> Link    :: https://www.pixiv.net/en/artworks/89103515
 - -                                                  - -
 >> Client Overview:
 >> This program implements a Client for the Server Program bundled with this program.
 >> This program creates a JavaFX user interface to interact with the Client class.
 >> This class ClientGUI creates the view for the Client, the actual client side logic
 >> is handled in the ClientLogic Class.
--------------------------------------------------------------------------------------- */
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.control.TextField;
import javafx.scene.layout.Background;
import javafx.application.Application;
import javafx.scene.layout.StackPane;
import javafx.scene.control.TextArea;
import javafx.application.Platform;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.layout.Pane;
import javafx.scene.Scene;
import javafx.stage.Stage;

// ClientGUI class that handles client view ::                                         - -
public class ClientGUI extends Application
{
    // GUI related ::                                                                  - -
    private Pane portEntryPane, mainPane;
    private Background background;
    private StackPane root;
    private TextArea gameArea;

    // Entrypoint for Client :: (main)                                                 - -
    public static void main(String[] args) { launch(args); }

    /** setupPortEntryPane ::                                                          - -
    Sets up the port number entry pane.
        - -                                                                             */
    private void setupPortEntryPane()
    {
        // Element creation:
        this.portEntryPane = new Pane();
        TextField portField = new TextField("");
        Button portButton = new Button("Bind Port");
        Button exitButton = new Button("Exit");

        // Client BG image:
        BackgroundImage bgImage = new BackgroundImage(
            new Image("File:src/main/resources/bg.jpg"),
            BackgroundRepeat.REPEAT,
            BackgroundRepeat.REPEAT,
            BackgroundPosition.DEFAULT,
            BackgroundSize.DEFAULT
        );
        this.background = new Background(bgImage);

        // Styling:
        portField.setStyle("-fx-control-inner-background: black; -fx-text-fill: white;");
        exitButton.setStyle("-fx-background-color: black; -fx-text-fill: white;");
        portButton.setStyle("-fx-background-color: black; -fx-text-fill: white;");

        portField.setPrefSize(400, 40);
        portButton.setPrefSize(197, 40);
        exitButton.setPrefSize(197, 40);

        portField.setLayoutX(440);
        portField.setLayoutY(300);

        portButton.setLayoutX(440);
        portButton.setLayoutY(345);

        exitButton.setLayoutX(643);
        exitButton.setLayoutY(345);

        // Button lambdas:
        exitButton.setOnAction(e -> { Platform.exit(); });

        portButton.setOnAction(e ->
        {
            int portNumber = toDigit(portField.getText());
            if (portNumber == -1) {
                portField.setText("Invalid int.");
                return;
            }
            setupMainPane(portNumber);
            root.getChildren().clear();
            root.getChildren().add(mainPane);
        });

        // Add elements to Pane:
        portEntryPane.getChildren().add(portField);
        portEntryPane.getChildren().add(portButton);
        portEntryPane.getChildren().add(exitButton);
        portEntryPane.setBackground(background);
    }

    /** setupMainPane ::                                                               - -
    Sets up the console log pane for the Server.
        - -                                                                             */
    private void setupMainPane(int portNumber)
    {
        // Element creation:
        mainPane = new Pane();
        TextField inputField = new TextField("");
        Button hardware = new Button("Hardware");
        Button resetButton = new Button("Reset");
        Button exitButton = new Button("Exit");
        Button animals = new Button("Animals");
        Button sendInput = new Button("Send");
        Button food = new Button("Food");
        gameArea = new TextArea("Rules:\n" +
            "1. This is a word guessing game similar to Wheel of Fortune.\n" +
            "2. You must successfully guess 3 words from 3 different categories.\n" +
            "3. You will have 6 char guesses allowed, correct guesses don't lower it.\n" +
            "4. On picking a category you will only be give the size of the word.\n" +
            "5. You are only allowed to guess a single character at a time.\n" +
            "6. You will lose the game if you guess 3 wrong words in 1 category.\n" +
            "7. As soon as you're ready to send a guess press the Send button.\n\n" +
            "Please select a category to start.");

        ClientLogic clientLogic = new ClientLogic(this, portNumber);
        clientLogic.linkAttributes(inputField,
                                   resetButton,
                                   gameArea,
                                   sendInput,
                                   animals,
                                   food,
                                   hardware);

        // Styling:
        inputField.setStyle("-fx-control-inner-background: black; -fx-text-fill: white;");
        gameArea.setStyle("-fx-control-inner-background: black; -fx-text-fill: white;");
        exitButton.setStyle("-fx-background-color: black; -fx-text-fill: white;");
        sendInput.setStyle("-fx-background-color: black; -fx-text-fill: white;");
        hardware.setStyle("-fx-background-color: black; -fx-text-fill: white;");
        animals.setStyle("-fx-background-color: black; -fx-text-fill: white;");
        resetButton.setStyle("-fx-background-color: black; -fx-text-fill: white;");
        food.setStyle("-fx-background-color: black; -fx-text-fill: white;");

        inputField.setEditable(false);
        gameArea.setEditable(false);
        gameArea.setWrapText(true);
        sendInput.setDisable(true);
        resetButton.setDisable(true);

        exitButton.setPrefSize(100, 40);
        inputField.setPrefSize(295, 40);
        gameArea.setPrefSize(400, 250);
        sendInput.setPrefSize(100, 40);
        hardware.setPrefSize(100, 40);
        animals.setPrefSize(100, 40);
        resetButton.setPrefSize(100, 40);
        food.setPrefSize(100, 40);

        sendInput.setLayoutX(740);
        sendInput.setLayoutY(455);

        resetButton.setLayoutX(335);
        resetButton.setLayoutY(245);

        animals.setLayoutX(845);
        animals.setLayoutY(200);

        food.setLayoutX(845);
        food.setLayoutY(245);

        hardware.setLayoutX(845);
        hardware.setLayoutY(290);

        gameArea.setLayoutX(440);
        gameArea.setLayoutY(200);

        exitButton.setLayoutX(335);
        exitButton.setLayoutY(200);

        inputField.setLayoutX(440);
        inputField.setLayoutY(455);

        // Button lambdas:
        animals.setOnAction   (e -> { clientLogic.categoryClick(1); });
        food.setOnAction      (e -> { clientLogic.categoryClick(2); });
        hardware.setOnAction  (e -> { clientLogic.categoryClick(3); });
        exitButton.setOnAction(e -> {
            clientLogic.closeAll("Client terminated successfully.");
        });

        resetButton.setOnAction(e -> {
            clientLogic.resetGame();
            inputField.setEditable(false);
            sendInput.setDisable(true);
            resetButton.setDisable(true);
        });

        sendInput.setOnAction(e -> { clientLogic.inputClick(); });

        // Add elements to Pane:
        mainPane.getChildren().add(exitButton);
        mainPane.getChildren().add(animals);
        mainPane.getChildren().add(food);
        mainPane.getChildren().add(hardware);
        mainPane.getChildren().add(gameArea);
        mainPane.getChildren().add(inputField);
        mainPane.getChildren().add(sendInput);
        mainPane.getChildren().add(resetButton);
        mainPane.setBackground(background);
    }

    /** start ::                                                                       - -
    Creates the two panes that will display the Server GUI.
        - -                                                                            - -
        @param primaryStage: A Stage object to be used to set the view.
        - -                                                                             */
    @Override
    public void start(Stage primaryStage) throws Exception
    {
        root = new StackPane();
        Scene scene = new Scene(root, 1280, 720);

        setupPortEntryPane();
        root.getChildren().add(portEntryPane);

        primaryStage.setTitle("Project 3 - Client :: Ryan Magdaleno");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    /** toDigit ::                                                                     - -
    Takes in a string representing a number we want to convert to an integer. If not
    possible then it will return -1.
        - -                                                                            - -
        @param str : A string to be converted to an int.
        @return int: str converted to an int, -1 indicates str was not a valid string.
        - -                                                                             */
    private int toDigit(String str)
    {
        if (str == null || str.length() == 0) { return -1; }
        try { return Integer.parseInt(str); }
        catch (NumberFormatException e) { return -1; }
    }

    // Exit GUI from ClientLogic class:
    public void guiExit() { Platform.exit(); }
}
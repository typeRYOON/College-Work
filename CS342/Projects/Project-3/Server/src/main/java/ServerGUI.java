/* Server.java */
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
 >> Server Overview ::
 >> This program implements a server using the ServerSocket and Socket java.net classes.
 >> This program will listen on a user defined port on the loopback IP address.
 >> This program listens for the client program to connect via its own socket via the
 >> same port on localhost. The game implemented is something like Hangman or Wheel of
 >> Fortune. The rules are shown in game. This class creates a ServerHandler to handle
 >> accepting connections on its own thread. That ServerHandler object will then create
 >> a ClientHandler object on its own thread and handle client and server packet logic.
--------------------------------------------------------------------------------------- */
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.layout.Background;
import javafx.application.Application;
import javafx.scene.layout.StackPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.application.Platform;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.layout.Pane;
import javafx.scene.Scene;
import javafx.stage.Stage;

// ServerGUI class that handles server view ::                                         - -
public class ServerGUI extends Application
{
    // GUI related ::                                                                  - -
    private Pane entryPane, mainPane;
    private Background background;
    private TextArea consoleLog;
    private StackPane root;

    // Server related ::                                                               - -
    private ServerHandler serverHandler;

    // Entrypoint for Server :: (main)                                                 - -
    public static void main(String[] args) { launch(args); }

    /** setupPortEntryPane ::                                                          - -
    Sets up the port number entry pane.
        - -                                                                             */
    private void setupPortEntryPane()
    {
        // Element creation:
        this.entryPane = new Pane();
        TextField portField = new TextField("");
        Button portButton = new Button("Bind Port");
        Button exitButton = new Button("Exit");

        // Server BG image:
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
            setupMainPage();
            root.getChildren().clear();
            root.getChildren().add(mainPane);

            serverHandler = new ServerHandler(consoleLog, portNumber);
            Thread serverThread = new Thread(serverHandler);
            serverThread.start();
        });

        // Add elements to Pane:
        entryPane.getChildren().add(portField);
        entryPane.getChildren().add(portButton);
        entryPane.getChildren().add(exitButton);
        entryPane.setBackground(background);
    }

    /** setupMainPage ::                                                               - -
    Sets up the console log pane for the Server.
        - -                                                                             */
    private void setupMainPage()
    {
        // Element creation:
        this.mainPane = new Pane();
        this.consoleLog = new TextArea("\n[Server] Accepting connections.");
        Button exitButton = new Button("Exit");

        // Styling:
        consoleLog.setStyle("-fx-control-inner-background: black; -fx-text-fill: white;");
        exitButton.setStyle("-fx-background-color: black; -fx-text-fill: white;");

        consoleLog.setEditable(false);
        consoleLog.setWrapText(true);

        consoleLog.setPrefSize(400, 640);
        exitButton.setPrefSize(100, 40);

        consoleLog.setLayoutX(440);
        consoleLog.setLayoutY(40);

        exitButton.setLayoutX(335);
        exitButton.setLayoutY(40);

        // Button lambdas:
        exitButton.setOnAction(e -> {
            serverHandler.terminateServer();
            Platform.exit();
        });

        // Add elements to Pane:
        mainPane.getChildren().add(consoleLog);
        mainPane.getChildren().add(exitButton);
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
        setupPortEntryPane();
        root = new StackPane(entryPane);
        Scene scene = new Scene(root, 1280, 720);

        primaryStage.setTitle("Project 3 - Server :: Ryan Magdaleno");
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
}
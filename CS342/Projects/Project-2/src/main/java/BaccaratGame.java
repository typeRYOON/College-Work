/* BaccaratGame.java */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Mark Hallenbeck.
 >> University of Illinois Chicago - CS 342, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> Program: Project-2: Baccarat Casino Game w/ GUI
 >> Course : CS 342 (37162), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : JDK 20 using Apache Maven
 - -                               - -
 >> BaccaratGame Overview:
 >> This program implements the casino game Baccarat, there's a GUI that makes it easy
 >> for the player to follow along the game. The BaccaratGame class has many sub classes
 >> for game logic, the dealer, and the game cards themselves. For more information on
 >> how to play, please start the game, and for specific rules, please look at the
 >> game logic class and given rules PDF.
--------------------------------------------------------------------------------------- */
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.layout.Background;
import javafx.application.Application;
import javafx.scene.control.TextField;
import javafx.scene.layout.StackPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.Button;
import javafx.application.Platform;
import javafx.scene.layout.Pane;
import javafx.scene.image.Image;
import java.util.ArrayList;
import javafx.stage.Stage;
import javafx.scene.Scene;

public class BaccaratGame extends Application
{   // Required assignment data field signatures:
    ArrayList<Card> playerHand;
    ArrayList<Card> bankerHand;
    BaccaratDealer theDealer;
    BaccaratGameLogic gameLogic;
    double currentBet;
    double totalWinnings;
    // Added data field signatures:
    String betPlacedOn;
    String betWinner;
    private StackPane root;
    private Scene scene;
    private Pane optionsPage;
    private Pane mainPage;


    /** evaluateWinnings:                                                              - -
    Given the currentBet, betPlacedOn, and betWinner, calculate winnings.
        - -                                                                            - -
        @return double: The amount the player won.                                      */
    public double evaluateWinnings()
    {
        double winnings = currentBet;
        currentBet = 0.0;

        if (betWinner != betPlacedOn)      // Bet * 0.0
            winnings = -winnings;
        else if (betPlacedOn == "Player")  // Bet + Bet
            winnings *= 2.0;
        else if (betPlacedOn == "Draw")    // Bet + Bet * 8
            winnings *= 9.0;
        else if (betPlacedOn == "Banker")  // Bet + Bet * 0.95
            winnings *= 1.95;
        return winnings;
    }


    // Default constructor:
    public BaccaratGame()
    {
        this.theDealer = new BaccaratDealer();
        this.gameLogic = new BaccaratGameLogic();
        this.theDealer.generateDeck();
        this.currentBet = 0.0;
        this.betPlacedOn = "None";
    }


    // Entry point for the program:                                                    - -
    public static void main(String[] args) { launch(args); }


    // Reset a BaccaratGame's internal attributes to a fresh start:                    - -
    private void freshStart(BaccaratGame g)
    {
        g.theDealer.generateDeck();
        g.totalWinnings = 0.0;
        g.currentBet = 0.0;
        g.betPlacedOn = "None";
    }


    // String formater for GUI:                                                        - -
    private String resultStr(String winner, String bet)
    {
        if (winner == bet) {
            return "\nCongrats, you bet " + bet + "! You win!";
        }
        return "\nSorry, you bet " + bet + "! You lost your bet!";
    }


    /** setupMainPage:                                                                 - -
    Setup the Pane for the main GUI page, only done once during start up.
        - -                                                                            - -
        @param game : A BaccaratGame object to reference for the GUI.
        @return Pane: The pane for the scene object.                                    */
    private Pane setupMainPage(BaccaratGame game)
    {   // Initial Setup:
        mainPage = new Pane();

        // TextField elements:
        TextField winningsBox = new TextField("Player Winnings: " + game.totalWinnings);
        TextField bidField = new TextField("Bid Field: Pick who to bet.");
        TextField betType = new TextField("None");

        // TextArea elements:
        TextArea console = new TextArea("Please Enter your bid/bet and hit the \"Run Round\" button.");
        TextArea pCards = new TextArea("Player Cards:");
        TextArea bCards = new TextArea("Banker Cards:");

        // Button elements:
        Button roundStart = new Button("Play");
        Button roundRun = new Button("Run Round");
        Button playerBet = new Button("Player");
        Button bankerBet = new Button("Banker");
        Button options = new Button("Options");
        Button drawBet = new Button("Draw");

        // Main page BG image:
        BackgroundImage bgImage = new BackgroundImage(
            new Image("File:src/main/resources/bg.jpg"),
            BackgroundRepeat.REPEAT,
            BackgroundRepeat.REPEAT,
            BackgroundPosition.DEFAULT,
            BackgroundSize.DEFAULT
        );

        // Element styling:
        bCards.setEditable(false);
        pCards.setEditable(false);
        console.setEditable(false);
        winningsBox.setEditable(false);
        bidField.setEditable(false);
        betType.setEditable(false);

        bCards.setWrapText(true);
        pCards.setWrapText(true);
        console.setWrapText(true);

        playerBet.setDisable(true);
        bankerBet.setDisable(true);
        drawBet.setDisable(true);
        roundRun.setDisable(true);

        bCards.setPrefSize(250, 250);
        pCards.setPrefSize(250, 250);
        console.setPrefSize(400, 250);
        winningsBox.setPrefSize(200, 40);
        roundStart.setPrefSize(100, 40);
        playerBet.setPrefSize(100, 40);
        bankerBet.setPrefSize(100, 40);
        bidField.setPrefSize(200, 40);
        roundRun.setPrefSize(100, 40);
        options.setPrefSize(140, 40);
        drawBet.setPrefSize(100, 40);
        betType.setPrefSize(100, 40);

        playerBet.setStyle("-fx-font-size: 16;");
        bankerBet.setStyle("-fx-font-size: 16;");
        drawBet.setStyle("-fx-font-size: 16;");
        options.setStyle("-fx-font-size: 20;");

        // Node element positioning:
        winningsBox.setLayoutX(384);
        winningsBox.setLayoutY(550);

        roundStart.setLayoutX(688);
        roundStart.setLayoutY(592);
        
        playerBet.setLayoutX(586);
        playerBet.setLayoutY(550);

        bankerBet.setLayoutX(688);
        bankerBet.setLayoutY(550);

        bidField.setLayoutX(384);
        bidField.setLayoutY(592);

        roundRun.setLayoutX(790);
        roundRun.setLayoutY(592);

        console.setLayoutX(438);
        console.setLayoutY(200);

        drawBet.setLayoutX(790);
        drawBet.setLayoutY(550);

        betType.setLayoutX(586);
        betType.setLayoutY(592);

        pCards.setLayoutX(100);
        pCards.setLayoutY(200);

        bCards.setLayoutX(930);
        bCards.setLayoutY(200);

        // Node Action Behavior:
        options.setOnAction(e -> {
            root.getChildren().clear();
            root.getChildren().add(optionsPage);
        });

        playerBet.setOnAction(e -> {
            game.betPlacedOn = "Player";
            roundRun.setDisable(false);
            bidField.setEditable(true);
            betType.setText("Player");
            bidField.clear();
        });

        bankerBet.setOnAction(e -> {
            game.betPlacedOn = "Banker";
            roundRun.setDisable(false);
            bidField.setEditable(true);
            betType.setText("Banker");
            bidField.clear();
        });

        drawBet.setOnAction(e -> {
            game.betPlacedOn = "Draw";
            roundRun.setDisable(false);
            bidField.setEditable(true);
            betType.setText("Draw");
            bidField.clear();
        });

        roundStart.setOnAction(e -> {
            console.setText("Please Enter your bid/bet and hit the \"Run Round\" button.");
            bidField.setText("Bid Field: Pick who to bet.");
            pCards.setText("Player Cards:");
            bCards.setText("Banker Cards:");
            roundStart.setDisable(true);
            playerBet.setDisable(false);
            bankerBet.setDisable(false);
            drawBet.setDisable(false);
            betType.setText("None");
            game.betPlacedOn = "";
        });

        // Baccarat Game Run Lambda:
        roundRun.setOnAction(e -> {
            game.currentBet = toDigit(bidField.getText());
            if (game.currentBet < 0) {
                bidField.setText("Invalid number.");
                return;
            }

            // Regenerate deck if deck size is < 6.
            if (game.theDealer.deckSize() < 6) {
                game.theDealer.generateDeck();
            }
            // Deal hands:
            game.playerHand = game.theDealer.dealHand();
            game.bankerHand = game.theDealer.dealHand();

            // Setup variables:
            Card playerDealt = null, bankerDealt = null;
            pCards.setText("Player Cards:");
            bCards.setText("Banker Cards:");

            // Initial hand values:
            int playerVal = game.gameLogic.handTotal(game.playerHand);
            int bankerVal = game.gameLogic.handTotal(game.bankerHand);

            // See who won in current state:
            game.betWinner = game.gameLogic.whoWon(game.playerHand, game.bankerHand);

            // Card box initial draw setup:
            for (Card curCard : game.playerHand) pCards.appendText(curCard.cardStr());
            for (Card curCard : game.bankerHand) bCards.appendText(curCard.cardStr());

            // Set Button usage for next round:
            roundStart.setDisable(false);
            bidField.setEditable(false);
            bankerBet.setDisable(true);
            playerBet.setDisable(true);
            roundRun.setDisable(true);
            drawBet.setDisable(true);

            // Natural Draw:
            console.setText("Player Total: " + playerVal + " Banker Total: " + bankerVal);
            if (playerVal - 7 > 0 && bankerVal - 7 > 0) {
                console.appendText("\nDraw occured" + game.resultStr(game.betWinner, game.betPlacedOn));

                game.totalWinnings += game.evaluateWinnings();
                winningsBox.setText("Player Winnings: " + game.totalWinnings);
                return;
            }

            // Natural Player Win:
            if (playerVal - 7 > 0) {
                console.appendText("\nPlayer wins" + game.resultStr(game.betWinner, game.betPlacedOn));

                game.totalWinnings += game.evaluateWinnings();
                winningsBox.setText("Player Winnings: " + game.totalWinnings);
                return;
            }

            // Natural Banker Win:
            if (bankerVal - 7 > 0) {
                console.appendText("\nBanker wins" + game.resultStr(game.betWinner, game.betPlacedOn));

                game.totalWinnings += game.evaluateWinnings();
                winningsBox.setText("Player Winnings: " + game.totalWinnings);
                return;
            }
            console.appendText("\n\nNatural win did not occur...");

            // Player draw one:
            if (game.gameLogic.evaluatePlayerDraw(game.playerHand)) {
                console.appendText("\nPlayer gets to draw an extra card.");
                playerDealt = game.theDealer.drawOne();
                pCards.appendText(playerDealt.cardStr());

                game.playerHand.add(playerDealt);
                playerVal = game.gameLogic.handTotal(game.playerHand);
            }
            
            // Banker draw one:
            if (game.gameLogic.evaluateBankerDraw(game.bankerHand, playerDealt)) {
                console.appendText("\nBanker gets to draw an extra card.");
                bankerDealt = game.theDealer.drawOne();
                bCards.appendText(bankerDealt.cardStr());

                game.bankerHand.add(bankerDealt);
                bankerVal = game.gameLogic.handTotal(game.bankerHand);
            }
            // Set final results:
            game.betWinner = game.gameLogic.whoWon(game.playerHand, game.bankerHand);
            console.appendText("\n\nPlayer Total: " + playerVal + " Banker Total: " + bankerVal);
            console.appendText("\n" + game.betWinner + " wins");
            console.appendText(game.resultStr(game.betWinner, game.betPlacedOn));

            game.totalWinnings += game.evaluateWinnings();
            winningsBox.setText("Player Winnings: " + game.totalWinnings);
        });
        // Add elements to Pane:
        mainPage.getChildren().add(options);
        mainPage.getChildren().add(drawBet);
        mainPage.getChildren().add(betType);
        mainPage.getChildren().add(bidField);
        mainPage.getChildren().add(roundRun);
        mainPage.getChildren().add(playerBet);
        mainPage.getChildren().add(bankerBet);
        mainPage.getChildren().add(roundStart);
        mainPage.getChildren().add(winningsBox);
        mainPage.getChildren().add(console);
        mainPage.getChildren().add(pCards);
        mainPage.getChildren().add(bCards);
        mainPage.setBackground(new Background(bgImage));
        return mainPage;
    }

    /** setupOptionsPage:                                                              - -
    Setup the Pane for the options GUI page, only done once during start up.
        - -                                                                            - -
        @param game : A BaccaratGame object to reference for the GUI.
        @return Pane: The pane for the scene object.                                    */
    private Pane setupOptionsPage(BaccaratGame game)
    {   // Initial Setup:
        optionsPage = new Pane();

        // Button elements:
        Button freshButton = new Button("Fresh Start");
        Button optionsButton = new Button("Options");
        Button exitButton = new Button("Exit");

        // Options page BG image:
        BackgroundImage bgImage = new BackgroundImage(
            new Image("File:src/main/resources/bg.jpg"),
            BackgroundRepeat.REPEAT,
            BackgroundRepeat.REPEAT,
            BackgroundPosition.DEFAULT,
            BackgroundSize.DEFAULT
        );

        // Element styling:
        optionsButton.setPrefSize(140, 40);
        freshButton.setPrefSize(200, 80);
        exitButton.setPrefSize(200, 80);

        optionsButton.setStyle("-fx-font-size: 20;");
        freshButton.setStyle("-fx-font-size: 20;");
        exitButton.setStyle("-fx-font-size: 20;");

        // Node element positioning:
        freshButton.setLayoutX(685);
        freshButton.setLayoutY(290);

        exitButton.setLayoutX(385);
        exitButton.setLayoutY(290);

        // Node Behavior:
        exitButton.setOnAction(e -> {
            Platform.exit();
        });

        optionsButton.setOnAction(e ->{
            root.getChildren().clear();
            root.getChildren().add(mainPage);
        });

        // Restart Baccarat game environment:
        freshButton.setOnAction(e -> {
            // Clear attributes:
            freshStart(game);
            root.getChildren().clear();

            // Reset specific TextFields/TextAreas:
            for (javafx.scene.Node node : mainPage.getChildren()) {
                if (node instanceof TextField) {
                    TextField t = (TextField) node;
                    if (t.getText().contains("Player Winnings: ")) {
                        t.setText("Player Winnings: " + game.totalWinnings);
                    }
                    else if (t.getText().contains("Player")) {
                        t.setText("None");
                    }
                    else if (t.getText().contains("Banker")) {
                        t.setText("None");
                    }
                    else if (t.getText().contains("Draw")) {
                        t.setText("None");
                    }
                }
                else if (node instanceof TextArea) {
                    TextArea ta = (TextArea) node;
                    if (ta.getText().contains("Player Cards:")) {
                        ta.setText("Player Cards:");
                    }
                    else if (ta.getText().contains("Banker Cards:")) {
                        ta.setText("Banker Cards:");
                    }
                    else {
                        ta.setText("Please Enter your bid/bet and hit the \"Run Round\" button.");
                    }
                }
            }
            // Clear bidField:
            for (javafx.scene.Node node : mainPage.getChildren()) {
                if (node instanceof TextField) {
                    TextField t = (TextField) node;
                    if (t.getText().contains("Player Winnings: ")) continue;
                    if (t.getText().contains("None")) continue;
                    t.clear();
                }
            }
            root.getChildren().add(mainPage);
        });
        // Add elements to Pane:
        optionsPage.getChildren().add(exitButton);
        optionsPage.getChildren().add(freshButton);
        optionsPage.getChildren().add(optionsButton);
        optionsPage.setBackground(new Background(bgImage));
        return optionsPage;
    }

    @Override
    public void start(Stage primaryStage) throws Exception
    {   // Set up pages, and start GUI:
        root = new StackPane();
        scene = new Scene(root, 1280, 720);
        BaccaratGame theGame = new BaccaratGame();

        mainPage = setupMainPage(theGame);
        optionsPage = setupOptionsPage(theGame);
        root.getChildren().add(mainPage);

        primaryStage.setTitle("Project 2: Baccarat :: rmagd2");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    // Utility function for converting strings to ints:
    private int toDigit(String str)
    {
        int ret;
        if (str == null || str.length() == 0) {
            return -1;
        }
        try {
            return Integer.parseInt(str);
        }
        catch (NumberFormatException e) {
            return -1;
        }
    }
}
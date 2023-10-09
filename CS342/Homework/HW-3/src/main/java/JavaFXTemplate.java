/* JavaFXTemplate.java */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Mark Hallenbeck.
 >> University of Illinois Chicago - CS 342, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> Program: HW-3: JavaFX Exercise
 >> Course : CS 342 (37162), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : JDK 20 using Apache Maven
 - -                               - -
 >> JavaFX Exercise:
 >> This is a simple program that utilizes JavaFX. Simply displays the string a user
 >> entered inside a non-editable text field, some buttons as well are used.
--------------------------------------------------------------------------------------- */
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Background;
import javafx.application.Application;
import javafx.scene.control.Button;
import javafx.event.EventHandler;
import javafx.event.ActionEvent;
import javafx.scene.layout.VBox;
import javafx.scene.image.Image;
import javafx.scene.Scene;
import javafx.stage.Stage;

// Our application's GUI/event class:
public class JavaFXTemplate extends Application
{
    private TextField centerText, rightText;
    private Button button1, button2;
    private BackgroundImage bgImage;
    private BorderPane root;
    private Scene scene;

    public static void main(String[] args) { launch(args); }

    @Override
    public void start(Stage primaryStage) throws Exception
    {   // Root of all elements:
        root = new BorderPane();

        // Left Buttons:
        button1 = new Button("button 1");
        button2 = new Button("button 2");
        button1.setPrefSize(200, 100);
        button2.setPrefSize(200, 100);
        root.setLeft(new VBox(5, button1, button2));

        // Center/Right Textfields:
        centerText = new TextField("enter text here then press button 1");
        rightText = new TextField("final string goes here");
        rightText.setPrefSize(200, 100);
        rightText.setEditable(false);
        root.setCenter(centerText);
        root.setRight(rightText);

        // Background Image:
        bgImage = new BackgroundImage(
            new Image("File:src/main/resources/snif.jpg"),
            BackgroundRepeat.REPEAT,
            BackgroundRepeat.REPEAT,
            BackgroundPosition.DEFAULT,
            BackgroundSize.DEFAULT);
        root.setBackground(new Background(bgImage));

        // Button1 anonymous class, on press event:
        button1.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent e) {
                rightText.setText(centerText.getText()+" : from the center text field!");
                button1.setDisable(true);
                button1.setText("pressed");
            }
        });

        // Button 2 lambda expression, on press event:
        button2.setOnAction(e -> {
            centerText.clear();
            rightText.setText("final string goes here");
            button1.setDisable(false);
            button1.setText("button 1");
        });

        // Finish setting up scene and show:
        scene = new Scene(root, 1170, 848);
        primaryStage.setTitle("Ryan Magdaleno Homework 3");
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
/* JavaFXTemplate.java */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Mark Hallenbeck.
 >> University of Illinois Chicago - CS 342, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> Program: HW-5: JavaFXML Exercise
 >> Course : CS 342 (37162), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : JDK 20 using Apache Maven
 - -                               - -
 >> JavaFXML Exercise:
 >> This is a simple program that utilizes JavaFX and FXML. Simply displays the string
 >> a user entered inside a non-editable text field, some buttons as well are used.
--------------------------------------------------------------------------------------- */
import javafx.application.Application;
import javafx.scene.layout.BorderPane;
import javafx.scene.control.TextField;
import javafx.scene.control.Button;
import javafx.event.EventHandler;
import javafx.event.ActionEvent;
import java.io.IOException;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.fxml.*;


public class JavaFXTemplate extends Application
{   // FXML elements:
    @FXML
    private TextField centerText;
    @FXML
    private TextField rightText;
    @FXML
    private Button button1;
    @FXML
    private Button button2;

    // Button1 on press event:
    public void button1Action(ActionEvent event)
    {
        rightText.setText(centerText.getText() + " : from the center text field!");
        button1.setDisable(true);
        button1.setText("pressed");
    }

    // Button2 on press event:
    public void button2Action(ActionEvent event)
    {
        centerText.clear();
        rightText.setText("final string goes here");
        button1.setDisable(false);
        button1.setText("button 1");
    }

    @Override
    public void start(Stage primaryStage)
    {
        try {
            // Load FXML files into FXML elements:
            FXMLLoader loader = new FXMLLoader(getClass().getResource("JavaFXTemplate.fxml"));
            BorderPane root = loader.load();

            primaryStage.setTitle("Ryan Magdaleno Homework 5");
            primaryStage.setScene(new Scene(root, 1170, 848));
            primaryStage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) { launch(args); }
}
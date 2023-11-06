/* HomeworkFour.java */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Mark Hallenbeck.
 >> University of Illinois Chicago - CS 342, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> Program: HW-4: Proxy Class Design Pattern w/ GUI
 >> Course : CS 342 (37162), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : JDK 20 using Apache Maven
 - -                               - -
 >> Proxy Design Pattern Overview:
 >> This program's source code shows the way the Proxy Class Design Pattern is
 >> implemented using a main class and a proxy wrapper class. The classes themselves are
 >> very simple and is meant more to show the class relationship. More details on the
 >> design pattern's pros and cons are within the bundled PDF.
--------------------------------------------------------------------------------------- */
import javafx.scene.layout.BackgroundPosition;
import javafx.scene.layout.BackgroundRepeat;
import javafx.scene.layout.BackgroundImage;
import javafx.scene.layout.BackgroundSize;
import javafx.scene.layout.Background;
import javafx.application.Application;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.StackPane;
import javafx.scene.control.TextArea;
import javafx.application.Platform;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.layout.Pane;
import java.util.ArrayList;
import javafx.scene.Scene;
import javafx.stage.Stage;


// Interface for each class to make sure they have the same functions:
interface InterfaceA
{
    String funcA();
    String funcB();
    int funcC();
    int funcD();
}


// Main class to be proxied on:
class MainClass implements InterfaceA
{
    private int functionRan, n;

    public MainClass(int n)
    {
        this.n = n;
        functionRan = 0;
    }

    public String funcA()
    {
        functionRan = 1;
        return "Doing funcA, n: " + n;
    }

    public String funcB()
    {
        functionRan = 2;
        return "Doing funcB, n: " + n;
    }

    // N and functionRan getters:
    public int funcC() { functionRan = 3; return n; }
    public int funcD() { return functionRan; }
}


// Class wrapper:
class ProxyOfMainClass implements InterfaceA
{
    private MainClass proxiedObj;
    public int n;

    public ProxyOfMainClass(int n)
    {   // Do not make actual object until needed:
        this.n = n;
    }

    // Construct actual mainClass when needed
    private void loadMainClassObj()
    {
        if (proxiedObj == null) {
            proxiedObj = new MainClass(this.n);
        }
    }

    // proxiedObj funcA:
    public String funcA()
    {
        loadMainClassObj();
        return proxiedObj.funcA();
    }

    // proxiedObj funcB:
    public String funcB()
    {
        loadMainClassObj();
        return proxiedObj.funcB();
    }

    // Get N from proxiedObj:
    public int funcC()
    {
        loadMainClassObj();
        return proxiedObj.funcC();
    }

    // Get functionRan from proxiedObj:
    public int funcD()
    {
        loadMainClassObj();
        return proxiedObj.funcD();
    }

    // Return linked main class object reference:
    public MainClass getLinkedMainObject() { return proxiedObj; }
}


public class HomeworkFour extends Application {
    private ProxyOfMainClass obj;
    private StackPane root;
    private Pane mainPage;
    private Scene scene;

    public static void main(String[] args) { launch(args); }

    private void setupMainPage(ProxyOfMainClass classObj)
    {
        mainPage = new Pane();
        String returnedStr;

        Button fA = new Button("funcA");
        fA.setPrefSize(100, 40);
        fA.setLayoutX(430);
        fA.setLayoutY(525);

        Button fB = new Button("funcB");
        fB.setPrefSize(100, 40);
        fB.setLayoutX(530);
        fB.setLayoutY(525);

        Button fC = new Button("funcC");
        fC.setPrefSize(100, 40);
        fC.setLayoutX(630);
        fC.setLayoutY(525);

        Button fD = new Button("funcD");
        fD.setPrefSize(100, 40);
        fD.setLayoutX(730);
        fD.setLayoutY(525);

        Button exitButton = new Button("Exit");
        exitButton.setPrefSize(100, 40);

        TextArea console = new TextArea("");
        console.setEditable(false);
        console.setPrefSize(400, 400);
        console.setLayoutX(430);
        console.setLayoutY(120);

        TextArea loaded = new TextArea("Main object not loaded.");
        loaded.setEditable(false);
        loaded.setPrefSize(400, 20);
        loaded.setLayoutX(430);
        loaded.setLayoutY(80);

        // BG image:
        BackgroundImage bgImage = new BackgroundImage(
            new Image("File:src/main/resources/bg.jpg"),
            BackgroundRepeat.REPEAT,
            BackgroundRepeat.REPEAT,
            BackgroundPosition.DEFAULT,
            BackgroundSize.DEFAULT
        );

        // Button Lambdas:
        fA.setOnAction(e -> {
            loaded.setText("Main object loaded.");
            console.setText(classObj.funcA());
        });

        fB.setOnAction(e -> {
            loaded.setText("Main object loaded.");
            console.setText(classObj.funcB());
        });

        fC.setOnAction(e -> {
            loaded.setText("Main object loaded.");
            console.setText("Current n: " + classObj.funcC());
        });

        fD.setOnAction(e -> {
            loaded.setText("Main object loaded.");
            console.setText("Current functionRan: " + classObj.funcD());
        });

        exitButton.setOnAction(e -> {
            Platform.exit();
        });

        // Add each element to pane:
        mainPage.getChildren().add(fA);
        mainPage.getChildren().add(fB);
        mainPage.getChildren().add(fC);
        mainPage.getChildren().add(fD);
        mainPage.getChildren().add(loaded);
        mainPage.getChildren().add(console);
        mainPage.getChildren().add(exitButton);
        mainPage.setBackground(new Background(bgImage));
    }

    @Override
    public void start(Stage primaryStage) throws Exception
    {
        root = new StackPane();
        scene = new Scene(root, 1280, 720);
        obj = new ProxyOfMainClass(100);

        setupMainPage(obj);
        root.getChildren().add(mainPage);

        primaryStage.setTitle("HW-4 - Proxy design pattern :: rmagd2");
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
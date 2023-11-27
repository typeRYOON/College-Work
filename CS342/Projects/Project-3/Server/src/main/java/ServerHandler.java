/* ServerHandler.java */
import javafx.scene.control.TextArea;
import java.net.ServerSocket;
import java.io.IOException;
import java.net.Socket;

// Runnable Class for accepting socket connections ::                                  - -
class ServerHandler implements Runnable
{
    // GUI related ::                                                                  - -
    private TextArea consoleLog;

    // Server related ::                                                               - -
    private ServerSocket serverSocket;
    private int portNumber;

    /** ServerHandler ::                                                               - -
    Constuctor for this class, sets passed attributes to own private attributes.
        - -                                                                            - -
        @param consoleLog    : Reference to TextArea object.
        @param portNumber    : Port number to be used by Server.
        @return ServerHandler: New instance of ServerHandler.
        - -                                                                             */
    public ServerHandler(TextArea consoleLog, int portNumber)
    {
        this.portNumber = portNumber;
        this.consoleLog = consoleLog;
    }

    // Terminates server socket ::                                                     - -
    public void terminateServer()
    {
        try { serverSocket.close(); }
        catch (IOException e) {}
    }

    /** run ::                                                                         - -
    The entry point for this runnable object's thread. Sets up the server and starts
    accepting connecting sockets. If there's a connection, set up a ClientHandler
    object on its own thread.
        - -                                                                             */
    @Override
    public void run()
    {
        int clientNumber = 1;
        try
        {
            serverSocket = new ServerSocket(portNumber);
            while (true) {
                Socket clientSocket = serverSocket.accept();
                consoleLog.appendText("\n[Client " + clientNumber + "] Connected.");
                Thread clientThread = new Thread(new ClientHandler(clientSocket,
                                                 consoleLog,
                                                 clientNumber++));
                clientThread.start();
            }
        } catch (IOException e) { System.out.println("Server terminated."); }
    }
}
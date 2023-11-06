/* HomeworkFourTests.java */
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


// Class for testing the src\main\java\HomeworkFour classes:
class MyTest
{
    // Wrapper object:
    static ProxyOfMainClass proxyObj;

    @BeforeAll
    static void setUpProxy()
    {
        proxyObj = new ProxyOfMainClass(100);
    }

    @Test
    void ConstructorTest()
    {   // Check both constructor values:
        setUpProxy();
        assertEquals(0, proxyObj.funcD());
        assertEquals(100, proxyObj.funcC());
        assertNotNull(proxyObj.getLinkedMainObject());
    }

    @Test
    void funcATest()
    {
        assertEquals("Doing funcA, n: 100", proxyObj.funcA());
    }

    @Test
    void funcBTest()
    {
        assertEquals("Doing funcB, n: 100", proxyObj.funcB());
    }

    @Test
    void funcCTest()
    {
        assertEquals(100, proxyObj.funcC());
    }

    @Test
    void funcDTest()
    {   // functionRan attribute changes based on function ran:
        proxyObj.funcA();
        assertEquals(1, proxyObj.funcD());

        proxyObj.funcB();
        assertEquals(2, proxyObj.funcD());
        
        proxyObj.funcC();
        assertEquals(3, proxyObj.funcD());
    }

    @Test
    void getLinkedMainObjectTest()
    {
        setUpProxy();
        // Unloaded reference:
        assertNull(proxyObj.getLinkedMainObject());

        // Loaded reference:
        proxyObj.funcA();
        assertNotNull(proxyObj.getLinkedMainObject());
    }

    @Test
    void attributeTestA()
    {
        proxyObj = new ProxyOfMainClass(1);
        assertEquals(1, proxyObj.funcC());
        assertNotNull(proxyObj.getLinkedMainObject());
        setUpProxy();
    }

    @Test
    void attributeTestB()
    {
        proxyObj = new ProxyOfMainClass(2);
        assertEquals(2, proxyObj.funcC());
        assertNotNull(proxyObj.getLinkedMainObject());
        setUpProxy();
    }

    @Test
    void NullTestA()
    {
        setUpProxy();
        // Initally unloaded when no functions are ran:
        assertNull(proxyObj.getLinkedMainObject());
    }

    @Test
    void NullTestB()
    {
        setUpProxy();
        // Get loaded when a functions is ran:
        proxyObj.funcA();
        assertNotNull(proxyObj.getLinkedMainObject());
    }
}

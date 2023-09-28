import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.File;

class MyMoneyTest
{
    static MyMoney m1, m2, m3;
    double holdI[] = {.055, .075, .045, .09, .10, .065, .035, .025};
    double holdC[] = {4000, 5500, 15000, 18000, 24000, 9000, 11000, 12000};
    double x[];

	@BeforeAll
    static void makeObj()
    {
        m1 = new MyMoney("values.txt", 8, 1);
        m2 = new MyMoney("values2.txt", 8, 2);
        m3 = new MyMoney("values.txt", "values2.txt", 8, 8);
    }

    @Test  // MyMoney Constructor A type 1:
    void MyMoneyA_T1()
    {   // 8 length array:
        x = m1.getCashValues();
        assertEquals(8, x.length);

        // Check values:
        assertArrayEquals(holdC, x);
        assertNotNull(x);
        for (int i = 0; i < 8; ++i) {
            assertEquals(holdC[i], x[i]);
        }

        // Interest array should be Null:
        assertArrayEquals(null, m1.getInterestValues());
    }
    
    @Test  // MyMoney Constructor A type 2:
    void MyMoneyA_T2()
    {   // 8 length array:
        x = m2.getInterestValues();
        assertEquals(8, x.length);

        // Check values:
        assertArrayEquals(holdI, x);
        assertNotNull(x);
        for (int i = 0; i < 8; ++i) {
            assertEquals(holdI[i], x[i]);
        }

        // Cash array should be Null:
        assertArrayEquals(null, m2.getCashValues());
    }

    @Test  // MyMoney Constructor B:
    void MyMoneyB()
    {
        x = m3.getCashValues();
        assertEquals(8, x.length);

        // Check cash values:
        assertArrayEquals(holdC, x);
        assertNotNull(x);
        for (int i = 0; i < 8; ++i) {
            assertEquals(holdC[i], x[i]);
        }

        x = m3.getInterestValues();
        assertEquals(8, x.length);

        // Check interest values:
        assertArrayEquals(holdI, x);
        assertNotNull(x);
        for (int i = 0; i < 8; ++i) {
            assertEquals(holdI[i], x[i]);
        }
    }

    @ParameterizedTest
    @ValueSource(strings = {"values.txt", "values2.txt"})
    void MyMoneyA_T1_PTest(String fileName)
    {
        try {
            File f = new File("src/main/resources/" + fileName);
            Scanner s = new Scanner(f);
            double[] x = (fileName.equals("values.txt")) ? m3.getCashValues() : m3.getInterestValues();

            double nextNum;
            int i = 0;
            while (s.hasNextDouble()) {
                nextNum = s.nextDouble();
                assertEquals(nextNum, x[i]);
                i++;
            }
            s.close();
        }
        catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Test
    void lumpSum_ConstantRate_Test1()
    {
        double total = m1.lumpSum_ConstantRate(holdC[0], holdI[0], 10);
        assertEquals(6833, Math.round(total));
    }

    @Test
    void lumpSum_ConstantRate_Test2()
    {
        double total = m3.lumpSum_ConstantRate(1500, 0.75, 10);
        assertEquals(404084, Math.round(total));
    }

    @Test
    void lumpSum_VariableRate_Test1()
    {
        double total = m3.lumpSum_VariableRate(12345);
        assertEquals(19820, Math.round(total));
    }

    @Test
    void lumpSum_VariableRate_Test2()
    {
        double total = m2.lumpSum_VariableRate(125);
        assertEquals(201, Math.round(total));
    }

    @Test
    void compoundSavings_sameContribution_Test1()
    {
        double total = m2.compoundSavings_sameContribution(125, 0.9, 10);
        assertEquals(85015, Math.round(total));
    }

    @Test
    void compoundSavings_sameContribution_Test2()
    {
        double total = m2.compoundSavings_sameContribution(100, 1.5, 3);
        assertEquals(975, Math.round(total));
    }

    @Test
    void compoundSavings_variableContribution_Test1()
    {
        double total = m1.compoundSavings_variableContribution(0.75);
        assertEquals(961490, Math.round(total));
    }

    @Test
    void compoundSavings_variableContribution_Test2()
    {
        double total = m1.compoundSavings_variableContribution(0.74);
        assertEquals(934848, Math.round(total));
    }
}
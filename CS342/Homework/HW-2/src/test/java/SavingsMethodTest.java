import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

class SavingsMethodTest
{
    static MyMoney m1;
    static double cash[];
    static double interest[];

    @BeforeAll
    static void makeObj()
    {
        m1 = new MyMoney("values.txt", "values2.txt", 8, 8);
        cash = m1.getCashValues();
        interest = m1.getInterestValues();
    }

    @Test
    void futureValueLumpSum_Test1()
    {
        double total = SavingsFormulas.futureValueLumpSum(cash[0], interest[0], 10);
        assertEquals(6833, Math.round(total));
    }

    @Test
    void futureValueLumpSum_Test2()
    {
        double total = SavingsFormulas.futureValueLumpSum(450, 0.5, 1);
        assertEquals(675, Math.round(total));
    }

    @Test
    void futureValueLS_VariableInterest_Test1()
    {
        double total = SavingsFormulas.futureValueLS_VariableInterest(45000, interest);
        assertEquals(72247, Math.round(total));
        
    }

    @Test
    void futureValueLS_VariableInterest_Test2()
    {
        double[] testInterest = {0.5, 0.5};
        double total = SavingsFormulas.futureValueLS_VariableInterest(cash[0], testInterest);
        assertEquals(9000, Math.round(total));
    }

    @Test
    void compoundSavingsConstant_Test1()
    {
        double total = SavingsFormulas.compoundSavingsConstant(cash[0], 0.8, 10);
        assertEquals(1780234, Math.round(total));
    }

    @Test
    void compoundSavingsConstant_Test2()
    {
        double total = SavingsFormulas.compoundSavingsConstant(10, 10, 3);
        assertEquals(1330, Math.round(total));
    }

    @Test 
    void compoundSavingsVariable_Test1()
    {
        double total = SavingsFormulas.compoundSavingsVariable(cash, 0.75);
        assertEquals(961490, Math.round(total));
    }

    @Test 
    void compoundSavingsVariable_Test2()
    {
        double cashTemp[] = {1, 10, 100, 1000, 10000};
        double total = SavingsFormulas.compoundSavingsVariable(cashTemp, 0.75);
        assertEquals(12119, Math.round(total));
    }
}

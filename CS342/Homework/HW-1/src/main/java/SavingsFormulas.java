/*SavingsFormulas.java*/
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Mark Hallenbeck.
 >> University of Illinois Chicago - CS 342, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> Program: HW1: SavingsFormulas.java
 >> Course : CS 342 (37162), FA23
 >> Author : Ryan Magdaleno (rmagd2)
 >> System : JDK 20 using Apache Maven
 - -                               - -
 >> SavingsFormulas class overview:
 >> This class is to be used by other classes. This class contains some formulas for
 >> calculating different finance equations with set inputs/parameters. More info on
 >> each function is within their respective docstrings.
--------------------------------------------------------------------------------------- */
public class SavingsFormulas
{
    /** futureValueLumpSum: - -                                                        - -
    This method takes a lump sum of money and figures out how much it will be worth in
    a certain number of years at a constant interest rate.
    FV = PV(1 + i)^N; PV = Principal value, i = interest rate, N = years.
        - -                                                                            - -
        @param cash    : Principal cash amount.
        @param interest: How much interest is compounded on top yearly.
        @param years   : N years.
        @return double : FV, The principal + interest accured.                          */
    public static double futureValueLumpSum(double cash, double interest, int years)
    {
        return cash * Math.pow(1 + interest, years);
    }

    /** futureValueLS_VariableInterest: - -                                            - -
    This method takes a lump sum of money and figures out how much it will be worth in
    a certain number of years at a varying interest rate per year.
        - -                                                                            - -
        @param cash   : Principal cash amount.
        @param values : Loaded with interest rates from values2.txt
        @return double: The principal + interest accured                                */
    public static double futureValueLS_VariableInterest(double cash, double[] values)
    {   // Recursive call chain entry:
        return futureValueHelper(0, cash, values);
    }

    /** futureValueHelper: - -                                                         - -
    Recursive helper function for "futureValueLS_VariableInterest" function.
        - -                                                                            - -
        @param i      : The current year, base case breaks when i == values.length.
        @param cash   : Current cash value for current year.
        @param values : A double array that holds interest rates corresponding to years.
        @return double: The Future value based on the varying interest rates.           */
    private static double futureValueHelper(int i, double cash, double[] values)
    {   // Base case:
        if (i == values.length) {
            return cash; 
        }
        return futureValueHelper(i+1, cash * (1 + values[i]), values);
    }

    /** compoundSavingsConstant: - -                                                   - -
    This method calculates the future value of saving the same amount of money each year
    for a certain number of years at a constant interest rate.
    FV = ((1 + i)^N - 1) / N * Pmt
    Pmt = cash, i = values[year], N = years
        - -                                                                            - -
        @param cash    : Principal cash amount.
        @param interest: Fixed interest rate.
        @param years   : Years to compound interest for.
        @return double : Value calculated; principal + interest.                        */
    public static double compoundSavingsConstant(double cash, double interest, int years)
    {   // ((1 + interest)^years - 1) / interest * cash
        return (Math.pow(1 + interest, years) - 1) / interest * cash;
    }

    /** compoundSavingsVariable: - -                                                   - -
    This method calculates the future value of investing a different amount of money at
    the end of each year for a certain number of years at a constant interest rate.
        - -                                                                            - -
        @param values  : A double array that holds interest rates corresponding to years.
        @param interest: Fixed interest rate.
        @return double : Returned Principal + interest rate from recursion.             */
    public static double compoundSavingsVariable(double values[], double interest)
    {   // Case - Empty values array:
        if (values.length == 0) {
            return 0.0;
        }
        // Entry via top of year chain down until year 0:
        return compoundSavingsHelper(values.length-1, values, interest+1);
    }

    /** compoundSavingsHelper: - -                                                     - -
    Recursive helper function for "compoundSavingsVariable" function.
        - -                                                                            - -
        @param i       : The current year within recursive call.
        @param values  : A double array that holds interest rates corresponding to years.
        @param interest: Fixed interest rate.
        @return double : Current Principal + interest rate.                             */
    public static double compoundSavingsHelper(int i, double values[], double interest)
    {   // Base case - Year 0:
        if (i == 0) {
            return values[0];
        }
        // ret Total[i - 1] * interest + values[i]. (interest = interest+1):
        return compoundSavingsHelper(i-1, values, interest) * interest + values[i];
    }
}  /* ---------------------------------- [Class End] ---------------------------------- */
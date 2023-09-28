import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

/*
 * This class will eventually work with a user interface to calculate various investment 
 * strategies for the user. 
 */
public class MyMoney{
	
	private double values[];
	
	public MyMoney(String filename, int size){
		values = new double[size];
		readInValues(filename);
		System.out.println("Values in file "+filename);
		this.printArray();
	}
	
	/*
	 * displays the future value at a fixed rate of interest of an
	 * initial principle balance for a fixed amount of years
	 */
	public void lumpSum_ConstantRate(double cash, double interest, int years) {
		
		double total = SavingsFormulas.futureValueLumpSum(cash, interest, years); 
		
	}
	
	/*
	 * displays the future value of an initial principle balance for a fixed
	 * amount of years at a variable interest rate.
	 */
	public void lumpSum_VariableRate(double cash) {
		
		double total = SavingsFormulas.futureValueLS_VariableInterest(cash, values);
	}
	
	/*
	 * displays the future value of identical yearly contributions over a fixed
	 * amount of years at fixed interest rates
	 */
	public void compoundSavings_sameContribution(double cash, double interest, int years) {
		
		double total = SavingsFormulas.compoundSavingsConstant(cash, interest, years); 
	}
	
	/*
	 * displays the future value of variable yearly contributions over a fixed 
	 * amount of years at a constant interest rate
	 */
	public void compoundSavings_variableContribution(double interest) {
	
		double total = SavingsFormulas.compoundSavingsVariable(values, interest);
		
	}
	
	
	/*
	 * method reads in double values from named file passed in. Format of the file
	 * is one value per line
	 */
	private void readInValues(String filename) {
		
		try {
			File f = new File("src/main/resources/"+filename);
			
			Scanner s = new Scanner(f);
			
			int i = 0;
			while(s.hasNextDouble()) {
				values[i] = s.nextDouble();
				i++;
			}
			
			s.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/*
	 * utility functions for testing....will eventually remove
	 */
	private void printArray() {
		
		for(int i = 0; i < values.length; i++) {
			System.out.println(values[i]+ " ");
		}
	}
	
	/* getter for private data member values
	 * this is where the double values from the file read in are stored
	 */
	public double[] getValues() {
		return values;
	}
	

}

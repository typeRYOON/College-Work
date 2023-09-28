import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

/*
 * This class will eventually work with a user interface to calculate various investment 
 * strategies for the user. 
 */
public class MyMoney{

	private double cashValues[];
	private double interestValues[];

	public MyMoney(String cashFilename, int...sizeAndType){
		if (sizeAndType[1] == 1) {
			cashValues = new double[sizeAndType[0]];
			readInValues(cashFilename, sizeAndType[1]);

            // Moved cash print here due to it not loading during interest load:
            System.out.println("Values in file "+cashFilename);
            this.printArray(); 
		}
        else {
			interestValues = new double[sizeAndType[0]];
			readInValues(cashFilename, sizeAndType[1]);
		}
	}

	public MyMoney(String cashFilename, String interestFilename, int...size){
		cashValues = new double[size[0]];
		interestValues = new double[size[1]];
		readInValues(cashFilename, 1);
		readInValues(interestFilename, 2);
		System.out.println("Values in file "+cashFilename);
		this.printArray();
	}
	

	
	/*
	 * displays the future value at a fixed rate of interest of an
	 * initial principle balance for a fixed amount of years
	 */
	public double lumpSum_ConstantRate(double cash, double interest, int years) {
		double total = SavingsFormulas.futureValueLumpSum(cash, interest, years); 
		return total;
		
	}
	
	/*
	 * displays the future value of an initial principle balance for a fixed
	 * amount of years at a variable interest rate.
	 */
	public double lumpSum_VariableRate(double cash) {
		
		double total = SavingsFormulas.futureValueLS_VariableInterest(cash, interestValues);
		return total;
	}
	
	/*
	 * displays the future value of identical yearly contributions over a fixed
	 * amount of years at fixed interest rates
	 */
	public double compoundSavings_sameContribution(double cash, double interest, int years) {
		
		double total = SavingsFormulas.compoundSavingsConstant(cash, interest, years);
		return total;
	}
	
	/*
	 * displays the future value of variable yearly contributions over a fixed 
	 * amount of years at a constant interest rate
	 */
	public double compoundSavings_variableContribution(double interest) {
	
		double total = SavingsFormulas.compoundSavingsVariable(cashValues, interest);
		return total;
		
	}
	
	
	/*
	 * method reads in double values from named file passed in. Format of the file
	 * is one value per line
	 */
	private void readInValues(String filename, int whichFile) {
		try {
			File f = new File("src/main/resources/"+filename);
			
			Scanner s = new Scanner(f);
			
			if (whichFile == 1) {
                int i = 0;
                while(s.hasNextDouble()) {
                    cashValues[i] = s.nextDouble();
                    i++;
                }
			}
			else {
				int i = 0;
				while(s.hasNextDouble()) {
					interestValues[i] = s.nextDouble();
					i++;
                }
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
		
		for(int i = 0; i < cashValues.length; i++) {
			System.out.println(cashValues[i]+ " ");
		}
	}
	
	/* getter for private data member values
	 * this is where the cash double values from the file read in are stored
	 */
	public double[] getCashValues() {
		return cashValues;
	}
	
	/* getter for private data member values
	 * this is where the cash double values from the file read in are stored
	 */
	public double[] getInterestValues() {
		return interestValues;
	}
	

}


public class SavingsFormulas {
	
	public static double futureValueLumpSum(double cash, double interest, int years) {
		//double total = Math.pow(interest, years) * cash; ERROR #2, 1+interest missing.
		return Math.pow(1 + interest, years) * cash;
	}
	
	public static double futureValueLS_VariableInterest(double cash, double values[]) {
		
		return recFV_VariableHelper(0,values,cash);
	}
	
	private static double recFV_VariableHelper(int years, double values[], double cash) {
		
		if (years == values.length){
			
			return cash;
		}
		else {
			cash = (1 + values[years]) * cash;
			
			return recFV_VariableHelper(years+=1, values, cash);
		}
	}
	
	public static double compoundSavingsConstant(double cash, double interest, int years) {
		double total = (((Math.pow(1+interest, years)) - 1)/interest) * cash;
		return total;
	}
	
	public static double compoundSavingsVariable(double values[], double interest) {
        // ERROR 3: interest needs to be interest+1.
		return recSavingsHelper(0,0,values, interest+1);
	}
	
	private static double recSavingsHelper(int years, double total, double values[], double interest) {
		
		if (years == values.length){
			double originalTotal = 0;
			
			for(double x:values) {
				originalTotal += x;
			}
			return total;
		}
		else {
			total = (interest * total) + values[years];
			return recSavingsHelper(years+=1, total, values, interest);
		}
	}
}

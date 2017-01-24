public class SimpleInterestCalculation{
	public static void calculateSI(Double principalAmount, Double noOfYears){
		Double rateOfInterest = 5;
		Double simpleInterest;
		
		simpleInterest = (principalAmount * noOfYears * rateOfInterest) / 100;
		
		System.debug('SimpleInterest: '+simpleInterest);		
	}
}


//SimpleInterestCalculation.calculateSI(10000,2);
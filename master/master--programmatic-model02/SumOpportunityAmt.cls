/*Write a SOQL query to retrieve sum of all closed Opportunity amount for current fiscal year. 
Store this information in a map with key as year and value as sum of amount. 
Iterate this map to display statistics.*/


public class SumOpportunityAmt{
	public static void getOppRecords(){
		try{
			Map<Integer,Decimal> myMap = new Map<Integer,Decimal>();
			List<AggregateResult> opportunityList = [SELECT SUM(Amount) Amt,FiscalYear FROM Opportunity WHERE IsClosed = true group by FiscalYear];
			Integer key;
			Decimal val;
			for(AggregateResult myOpp : opportunityList){
				key=(Integer)myOpp.get('Fiscal Year');
				val=(Decimal)myOpp.get('Amt');
				if(!myMap.containsKey(key)){
					myMap.put(key,val);
				}
			}
			for(Integer myMap1 : myMap.keySet()){
				System.debug(myMap1+' '+myMap.get(myMap1));
			}
		}catch(Exception e){
		}
	}
}
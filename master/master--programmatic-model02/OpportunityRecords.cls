/*
Write a SOQL query to display 100 opportunity records with amount greater than 10,000 order by created date. 
Skip first 50 records and include records from recycle bin.
*/



public class OpportunityRecords{
	public static void getRecords(){
		List<Opportunity> opportunityList = new List<Opportunity>();
		
		System.debug('Opportunity List: ');
		for(Opportunity opp: [Select id, Name, AccountId, Amount from Opportunity where Amount >= 10000 order by createddate asc limit 100 offset 50  all rows]){
			opportunityList.add(opp);
 			System.debug(opportunityList);
		}
	}
}
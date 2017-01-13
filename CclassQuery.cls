/*
Write SOQL query on 'C'(created above) to retrieve all records of 'C' with name 'John' along with parent details.
*/


public class CclassQuery{
	public static void getDetails(){
		List<C__c> cList = new List<C__c>();
		for(C__c cObject: [Select AC__r.Name from C__c where AC__r.Name = 'John']){
			cList.add(cObject);
		}
		System.debug(cList);
	}
}
/*
Write a SOQL query to find all Account records which have at least an opportunity record which is 
'Closed Won'. 
*/

public class AccountOpportunityQ{
	public static void getOppAccount(){
		List<Account> accountList = [Select id,Name,(Select Name from Opportunities) from Account where id in 
				(Select accountId from Opportunity where StageName='Closed Won')];
		System.debug(accountList);
	}
}
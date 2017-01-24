/*
Write a SOQL query to find all Account records which have at least an opportunity record which is 'Closed Won'.
*/


public class AccountOpportunityQ{
	public static void getOppAccount(){
		List<Account> accountList = new List<Account>();
		for(Account a: [SELECT Account.Name,(SELECT Opportunity.Name from Opportunities where StageName ='Closed won') from Account]){
			accountList.add(a);
		}
		System.debug(accountList);
	}
}
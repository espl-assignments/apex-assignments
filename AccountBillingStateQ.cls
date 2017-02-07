/*
5. Write a SOQL query to find all Account records where 'Billing State' is not 'Maharashtra' and 
'Kerala'. Order the results by Billing State in descending order with null values at the end. Display first 
10,000 records only. NOTE: do not use AND operator. 
*/


public class AccountBillingStateQ{
	public static void getRecords(){
		List<Account> accountList = [Select Id, Name,BillingState from Account where BillingState Not IN ('Maharashtra' ,'Kerela') order by BillingState desc NULLS LAST Limit 10000];
		System.debug(accountList);
	}
}
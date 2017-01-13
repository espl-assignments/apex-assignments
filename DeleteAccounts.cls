/*
Delete all inactive Account records created in last 90 days. 
*/


public class DeleteAccounts{
	public static void deleteRecords(){
	 List<Account> accountList = new List<Account>();
	 accountList = [Select Name, toLabel(Active__c) from Account where CreatedDate In (Last_90_DAYS)];
	 System.debug(accountList);	
	
	delete(accountList);
	 
	 List<Account> accountCheck = new List<Account>();
	 accountCheck = [Select Name, toLabel(Active__c) from Account where CreatedDate In (Last_90_DAYS)];
	 System.debug(accountCheck);
	}
}
/*
2. Delete all inactive Account records created in last 90 days
*/

public class DeleteAccounts{
	public static void deleteRecords(){
	 List<Account> accountList = new List<Account>();
	 accountList = [Select Name, Active__c from Account where CreatedDate In (Last_90_DAYS) and Active__c = 'no'];
	 System.debug(accountList);	
	
	delete(accountList);
	 
	 List<Account> accountCheck = new List<Account>();
	 accountCheck = [Select Name, Active__c from Account where CreatedDate In (Last_90_DAYS) and Active__c = 'no'];
	 System.debug(accountCheck);
	}
}
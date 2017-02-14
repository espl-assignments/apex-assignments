/*Write a SOQL query to retrieve/print the Account records where Created Date = Today*/

public class AccountRecords{
	public static void getAccountRecords(){
		
		for(Account accountlist : [SELECT Id,Name FROM Account WHERE CreatedDate = TODAY])
			System.debug(accountlist);
	}
}

//AccountRecords.getAccountRecords();
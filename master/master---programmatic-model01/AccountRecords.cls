public class AccountRecords{
	public static void getAccountRecords(){
		List<Account> accountList = new List<Account>();
		accountList = [SELECT Id,Name FROM Account WHERE CreatedDate = TODAY];
		
		for(Integer a = 0; a < accountList.size(); a++){
 			 System.debug(accountList[a]);
		}
	}
}

//AccountRecords.getAccountRecords();
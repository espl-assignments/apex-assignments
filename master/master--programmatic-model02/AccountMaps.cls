/*Prepare the following map structures : 
a. Account Name as key and AccountId as value. 
b. Account Id as key and entire Account object as value. */



public class AccountMaps{
	public static void createAccountMaps(){  
		//Account Name as key and AccountId as value. 
		Map<String,String> Mymap = new Map<String,String>();
		System.debug('Account List: AccountName as key and AccountId as value');
		for (Account acc: [Select Id, Name from Account]){
			Mymap.put(acc.Name, acc.Id);		
		}
		System.debug(MyMap);
		
		 //Account Id as key and entire Account object as value.
		Map<String,Account> Mymap1 = new Map<String,Account>();
		System.debug('Account List: AccountId as key and Accountobject as value');
		List<Account> accountList =[Select Id,Name from Account];
		for (Account acc1: accountList){
			Mymap1.put(acc1.Id, acc1);		
		}
		System.debug(MyMap1);
	}
}
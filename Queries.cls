public class Queries{
	public static void executeQueries(){
		List<Account> accountList = new List<Account>();
		accountList = [SELECT Id, Name, Phone FROM Account];
		String s = 'E';
		Integer i = 1 ;
		
		System.debug('Account records displayed using traditional for loop: ');
		for(Integer a = 0; a < accountList.size(); a++){
 			 System.debug(accountList[a]);
		}
	
		System.debug('Account records displayed using SOQL for loop: ');
		for (Account accountObject : [SELECT Id, Name from Account where Name LIKE :(s+'%')]) {
   			System.debug(accountObject);
		}
		
		System.debug('Account records displayed using while loop: ');
		while(i<=5){
			System.debug(accountList[i]);
			i++;
		}
	}
}

//Queries.executeQueries();
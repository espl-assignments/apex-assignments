public class AccountContactQR{
	public static void getRecords(){
		List<Account> accountList = new List<Account>();
		for(Account a: [SELECT Name,(SELECT Name from Contacts where Contact.FirstName = 'John') from Account]){
			accountList.add(a);
		}
		System.debug(accountList);
	}
}
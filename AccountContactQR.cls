/*
Write a SOQL query on Account and find all associated contact records of the Account which contains the word 'John'. Print all Account and Contact records retrieved 
*/
public class AccountContactQR{
	public static void getRecords(){
		List<Account> accountList = new List<Account>();
		for(Account a: [SELECT Name,(SELECT Name from Contacts where Contact.FirstName = 'John') from Account]){
			accountList.add(a);
		}
		System.debug(accountList);
	}
}
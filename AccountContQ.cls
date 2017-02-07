/*
Query on all Contact records and add them to the List. Print that contents of this list. 
*/
public class AccountContQ{
	public static void getAcctContacts(){
		List<Account> accountList = new List<Account>();
		for(Account a: [SELECT Account.Name,(SELECT Contact.FirstName, Contact.LastName from Account.Contacts) from Account])
		{
			accountList.add(a);
		}
		System.debug(accountList);
	}
}
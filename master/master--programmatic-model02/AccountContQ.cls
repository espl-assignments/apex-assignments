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
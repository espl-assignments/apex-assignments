/*
Write a SOQL query on Contact to retrieve all active contacts belonging to 'media' Industry. 
Also display the name of the account to which it is associated to. 
*/

public class AccountContactRQ{
	public static void getContacts(){
		List<Contact> contactList = new List<Contact>();
		for(Contact con: [SELECT Id, Name, Account.Name FROM Contact WHERE Account.Industry = 'media']){
			contactList.add(con);
		}
		System.debug(contactList);
	}
}
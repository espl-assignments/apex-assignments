public class ChildParentRelationship{
	public static void childparentrelation(){
		List<Contact> contactList = new List<Contact>();
		contactList = [SELECT Id, Name,Title, Account.Name, Account.Industry FROM Contact WHERE Account.Industry = 'Electronics'];
		for(Integer a = 0; a < contactList.size(); a++){
 			 System.debug(contactList[a]);
		}
	}
}
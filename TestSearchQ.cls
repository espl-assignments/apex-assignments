/*
Find the word 'test' in all name fields returning Contact, Account, Lead and User.
*/

public class TestSearchQ{
	public static void testsearch(){
		List<List<SObject>> searchList = [FIND 'Test*' IN Name FIELDS RETURNING  Account (Id,Name), Contact(FirstName, LastName, Name), Lead(FirstName, LastName, Name), Opportunity(Name)];
		System.debug(searchList);
	}
}
/*Write a SOQL query to retrieve/print all active Users. Prepare a Map having User Id as key and User 
record as value. */

public class UserRecords{
	public static void getActiveUsers(){

		Map<ID, User> myMap = new Map<ID, User>([SELECT Id, Name FROM User where isActive = true]);
		// After populating the map, iterate through the map entries
		for (ID idKey : myMap.keyset()) {
    		User a = myMap.get(idKey);
    		System.debug(a);
		}	
	}
}

//UserRecords.getActiveUsers();
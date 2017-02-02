public class QuerySearchMethod{
	public void dbQueryDemo(){
		list<sObject> myObject = Database.query('Select Id,Name from Employee__c');
		for(sObject obj : myObject){
			System.debug(obj);		
		}
	}
	public void dbSearchDemo(){
		String samplequery = 'Find \'Test*\'In All Fields Returning Contact(Id , Name)';
		list<list<Contact>> sampleContacts = Search.query(samplequery);
		System.debug(sampleContacts);
	}
}
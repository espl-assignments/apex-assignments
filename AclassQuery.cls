public class AclassQuery{
	public static void getDetails(){
		List<A__c> records = [Select Id, Name, (Select Id, Name from Cs__r where Name='john') from A__c];
        for(A__c a:records) {
            for(C__c clist : a.Cs__r) {
                System.debug('Parent details: ' + a +'Child Details: ' + clist);
            }
        }
	}
}
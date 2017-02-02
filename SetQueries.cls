public class SetQueries{
	public static void setLeadID(){
		List<Lead> leadRecord = new List<Lead>();
		leadRecord = [Select Id from Lead];
		Set<Id> resultIds = (new Map<Id,Lead>(leadRecord)).keySet();
 		System.debug('Lead Id: '+resultIds);
	
	}
}
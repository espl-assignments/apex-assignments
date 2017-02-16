/*
C. Generic Record Creation Engine 
1. The third party system will create events in a system to create any sobject's records. 
2. There will be a field will hold the JSON of the record & the object name. 
JSON : { 
	Name : Eternus Solutions  
} 
Object Name : Account 
3. so create a process which will execute per minute & process the Event's records creating the respective sObject.
*/


global class JSONRecordsBatch implements Database.Batchable <sObject> {
	String query;
	sObject sObjectRecord;
	global JSONRecordsBatch() {}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		query = 'select id,Name,JSONString__c,ObjectName__c,Serialized__c from Event__c where Serialized__c = false';
		return Database.getQueryLocator(query);
  	}

	global void execute(Database.BatchableContext BC, List<Event__c> scope) {
		List<sObject> ListRecords = new List<sObject>();
		List<Log__c> logs = new List<Log__c>();
		
		for(Event__c obj : scope){
			String jsonString = obj.JSONString__c;
            Type objectType = Type.forName(obj.ObjectName__c);
           	sObjectRecord = (sObject)JSON.deserialize(jsonString, objectType);
            obj.Serialized__c = true;
             ListRecords.add(sObjectRecord);
        }
       	/*Database.insert(ListRecords,false);
       	update scope;*/
       	
       	Database.SaveResult[] saveResultList = Database.insert(ListRecords,false);
		System.debug(ListRecords);
		
		for(Database.SaveResult sr: saveResultList){
			if(sr.isSuccess()){
				System.debug('Success' + sr.getId());
				update scope;
			}
			else{
				for(Database.Error err : sr.getErrors()){
					Log__c record = new Log__c(Error__c = 'Record data not properly inserted..');
					logs.add(record);
				}
				System.debug(logs);
				Database.insert(logs,false);
			}
		}
       	
       	
       	
	}
	
	global void finish(Database.BatchableContext BC) {
	}
}
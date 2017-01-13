/*
Create a custom object called as 'Logs'. Create a long text area field called as 'Error'. Create 100 
Lead records using DML operations having a unique name. For all records which were not inserted into 
Lead object, insert a record in Log object along with the reason why a record was not inserted. Also, 
execute assignment rules to auto allocate Lead records to correct owner. 

*/


public class LogLeadRecords{
	public static void insertLeads(){
		List<Lead> leadList = new List<Lead>();
		List<Log__c> logs = new List<Log__c>();
		for(Integer i = 1 ; i<=100 ; i++){
			Lead records = new Lead(LastName='abc' + i, Company = 'Eternus', Status='Working - Not Contacted');
			leadList.add(records);
		}
		Database.SaveResult[] saveResultList = Database.insert(leadList,false);
		System.debug(leadList);
		
		for(Database.SaveResult sr: saveResultList){
			if(sr.isSuccess()){
				System.debug('Success' + sr.getId());
			}
			else{
				for(Database.Error err : sr.getErrors()){
					Log__c record = new Log__c(Error__c = 'Corrupt Record');
					logs.add(record);
				}
				System.debug(logs);
				Database.insert(logs,false);
			}
		}
	}
}
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
		
		AssignmentRule AR = new AssignmentRule();
		AR = [select id from AssignmentRule where SobjectType = 'Lead' and Active = true];
		
		
		Database.DMLOptions dmo = new Database.DMLOptions();
		dmo.assignmentRuleHeader.assignmentRuleId = AR.id;
		
		for(Integer i = 1 ; i<=2 ; i++){
			Lead records = new Lead(LastName='testable' + i, Company = 'Eternus', Status='Working - Not Contacted');
			records.setOptions(dmo);
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
					Log__c record = new Log__c(Error__c = 'Record data not properly inserted..');
					logs.add(record);
				}
				System.debug(logs);
				Database.insert(logs,false);
			}
		}
	}
}
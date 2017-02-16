/*
Test class for JSONRecordsBatch class
 */
 
@isTest
private class JSONBatchTest {

    static testMethod void recordCreationCheck() {
       Event__c eve = new Event__c(Name = 'test' ,JSONString__c ='{"Name" : "Test"}' ,ObjectName__c = 'Account' ,Serialized__c = false);
    	insert eve;
    	
    	Test.startTest();
    	JSONRecordsBatch j = new JSONRecordsBatch ();
		Database.executeBatch(j);
    	Test.stopTest();
    }
    
	static testMethod void checkRecordCreation() {
       	Event__c eve = new Event__c(Name = 'test' ,JSONString__c ='{"Nme" : "Test"}' ,ObjectName__c = 'Account' ,Serialized__c = false);
		insert eve;
    	
    	Test.startTest();
    	JSONRecordsBatch j = new JSONRecordsBatch ();
		Database.executeBatch(j);
    	Test.stopTest();
    }
}
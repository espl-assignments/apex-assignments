/*
Test class for JSONRecordsBatch class
 */
 
@isTest
private class JSONBatchTest {

    static testMethod void recordCreationCheck() {
		Event__c eve = new Event__c(Name = 'test' ,JSONString__c ='{"Name" : "TestA"}' ,ObjectName__c = 'Account' ,Serialized__c = false);
    	
    	Test.startTest();
    	insert eve;		
    	JSONRecordsBatch j = new JSONRecordsBatch ();
		Database.executeBatch(j);
    	Test.stopTest();
    	
    	Event__c e = [Select Name, JSONString__c, ObjectName__c, Serialized__c from Event__c];
    	System.assert(e.ObjectName__c.contains('Account'));
    	
    	List<Account> acc = [Select Name from Account where Name = 'TestA'];
    	System.assertEquals(acc.size(),2);
    }
    
	static testMethod void checkRecordNotCreation() {
       	Event__c eve = new Event__c(Name = 'test' ,JSONString__c ='{"Nme" : "Test"}' ,ObjectName__c = 'Account' ,Serialized__c = false);
    	
    	Test.startTest();
    	insert eve;
    	JSONRecordsBatch j = new JSONRecordsBatch ();
		Database.executeBatch(j);
    	Test.stopTest();
    	
    	Event__c e = [Select Name, JSONString__c, ObjectName__c, Serialized__c from Event__c];
    	System.assert(e.ObjectName__c.contains('Account'));
    }
}
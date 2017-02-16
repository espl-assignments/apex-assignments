/*Test class for DupLeadRemoval class
 */
@isTest
private class DupLeadRemovalBatchTest {

    static testMethod void leadDupCheck_Name() {
    	DupLeadRemovalSettings__c dup = new DupLeadRemovalSettings__c ();
    	dup.Select_Name__c = true ;
    	insert dup;
    	Lead l = new Lead(LastName = 'test' ,Company = 'testCompany' ,Status = 'Open - Not Contacted' ,Email = 'test@gmail.com'); 
  		insert l;
  		Lead l1 = new Lead(LastName = 'test' ,Company = 'testCompany' ,Status = 'Open - Not Contacted' ,Email = 'test0@gmail.com');
  		insert l1;
  		
  		Test.startTest();
  		DupLeadRemoval dupLeadBatch = new DupLeadRemoval ();
		Database.executeBatch(dupLeadBatch);
		Test.stopTest();	
		
		Lead leads = [Select Id,Name,Email from Lead];
		System.assert(leads.Name.contains('test'));
    }
    
	static testMethod void leadDupCheck_Email() {
		DupLeadRemovalSettings__c dup = new DupLeadRemovalSettings__c ();
    	dup.Select_Email__c = true ;
    	insert dup;
    	Lead l = new Lead(LastName = 'test1' ,Company = 'testCompany' ,Status = 'Open - Not Contacted' ,Email = 'test@gmail.com'); 
  		insert l;
  		Lead l1 = new Lead(LastName = 'test' ,Company = 'testCompany' ,Status = 'Open - Not Contacted' ,Email = 'test@gmail.com');
  		insert l1;
  		
  		Test.startTest();
  		DupLeadRemoval dupLeadBatch = new DupLeadRemoval ();
		Database.executeBatch(dupLeadBatch);
		Test.stopTest();	
		
		Lead leads = [Select Id,Name,Email from Lead];
		System.assert(leads.Email.contains('test@gmail.com'));
    }
    
    static testMethod void leadDupCheck_Name_Email() {
    	DupLeadRemovalSettings__c dup = new DupLeadRemovalSettings__c ();
    	dup.Select_Name__c = true ;
    	dup.Select_Email__c = true ;
    	insert dup;
    	Lead l = new Lead(LastName = 'test2' ,Company = 'testCompany' ,Status = 'Open - Not Contacted' ,Email = 'test2@gmail.com'); 
  		insert l;
  		Lead l1 = new Lead(LastName = 'test2' ,Company = 'testCompany' ,Status = 'Open - Not Contacted' ,Email = 'test2@gmail.com');
  		insert l1;
  		
  		Test.startTest();
  		DupLeadRemoval dupLeadBatch = new DupLeadRemoval ();
		Database.executeBatch(dupLeadBatch);
		Test.stopTest();	
		
		Lead leads = [Select Id,Name,Email from Lead];
		System.assert(leads.Name.contains('test'));
    }
    
}
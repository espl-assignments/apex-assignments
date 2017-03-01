/*
Test class for AccContactOpportunities batch class
 */
@isTest
private class AccContOppBatchTest {

     static testMethod void executeAccountBatch() {
     	List<Account> accountSettings = AccContOppDataFactory.createRecords(1,1,1);
     	
        Test.startTest();
        AccContactOpportunities aobatch = new AccContactOpportunities ();
		Database.executeBatch(aobatch);
        Test.stopTest();
        
        List<Opportunity> opp = [SELECT Id,AccountId,Name,Amount FROM Opportunity WHERE AccountId =: accountSettings[0].Id];
     	System.assertEquals( 1, opp.size());	
     }
     
     
     static testMethod void executeAccBatch() {
		List<Account> accountSettings = AccContOppDataFactory.createRecords(1,1,0);
     	
        Test.startTest();
        AccContactOpportunities aobatch = new AccContactOpportunities ();
		Database.executeBatch(aobatch);
        Test.stopTest();
        
        List<Opportunity> opp = [SELECT Id,AccountId,Name,Amount FROM Opportunity WHERE AccountId =: accountSettings[0].Id];
     	System.assertEquals( 0, opp.size());	
     }
}
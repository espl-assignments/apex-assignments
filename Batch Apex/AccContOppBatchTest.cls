/*
Test class for AccContactOpportunities batch class
 */
@isTest
private class AccContOppBatchTest {

     static testMethod void executeAccountBatch() {
     	Account acc = new Account(name='test');
        insert acc;
        Opportunity opp = new Opportunity(Name='testopp' ,CloseDate= Date.newInstance(2015, 2, 15) ,StageName= 'Closed Won' ,Amount= 500 ,AccountId = acc.Id);
        insert opp;
        Contact con = new Contact(FirstName = 'contest' ,LastName='contest' ,Primarycontact__c = true, Email = 'test@gmail.com' ,AccountId = acc.Id);
        insert con;
        
        Test.startTest();
        AccContactOpportunities aobatch = new AccContactOpportunities ();
		Database.executeBatch(aobatch);
        Test.stopTest();
     }
}
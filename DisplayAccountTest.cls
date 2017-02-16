/**
Test class for DisplayAccountController
 */
@isTest
private class DisplayAccountTest {

   @isTest static void displayAccTest() {
        
        Account acc = new Account(Name='test', BillingCity = 'testcity', Phone = '1234560');
        insert acc;
        Opportunity opp = new Opportunity(Name='testopp' ,CloseDate= Date.newInstance(2015, 2, 15) ,StageName= 'Closed Won' ,AccountId = acc.Id);
        insert opp;
        Contact con = new Contact(FirstName = 'contest' ,LastName='contest' ,Email = 'test@gmail.com' ,AccountId = acc.Id);
        insert con;
        
        PageReference pageRef = Page.DisplayAccount;
        Test.setCurrentPageReference(pageRef);
        Test.startTest();
        DisplayAccountController incontroller = new DisplayAccountController();
        incontroller.selectAccount();
        Test.stopTest();
        System.assertEquals([select id, Name from Account], incontroller.accountList);
	}
	
	
	@isTest static void displayNotAccTest() {
        
        Account acc = new Account(Name='test', BillingCity = 'testcity', Phone = '1234560');
        Opportunity opp = new Opportunity(Name='testopp' ,CloseDate= Date.newInstance(2015, 2, 15) ,StageName= 'Closed Won' ,AccountId = acc.Id);
        insert opp;
        Contact con = new Contact(FirstName = 'contest' ,LastName='contest' ,Email = 'test@gmail.com' ,AccountId = acc.Id);
        insert con;
        
        PageReference pageRef = Page.DisplayAccount;
        Test.setCurrentPageReference(pageRef);
        Test.startTest();
        DisplayAccountController incontroller = new DisplayAccountController();
        incontroller.selectAccount();
        Test.stopTest();
        System.assertEquals([select id, Name from Account], incontroller.accountList);
	}
}
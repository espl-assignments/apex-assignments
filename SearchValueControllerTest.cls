/**
Test class for SearchValueController
 */
@isTest
private class SearchValueControllerTest {

    @isTest static void searchValueAccTest() {
		Account acc = new Account();
        acc.Name = 'test';
        insert acc;
       
       	PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = acc.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 'test';
        Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(1,incontroller.accountList.size());
	}
	
	@isTest static void searchValueLeadTest() {
        Lead l = new Lead(FirstName = 'test' ,LastName='test',Company='abc',Status = 'Open - Not Contacted');
        insert l;
        
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = l.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 'test';
        Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(1,incontroller.leadList.size());
	}
	
	@isTest static void searchValueOppTest() {
        Opportunity opp = new Opportunity(Name='test',CloseDate= Date.newInstance(2015, 2, 1),StageName= 'Closed Won');
        insert opp;
        
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();          
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = opp.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 'test';
		Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(1,incontroller.opportunityList.size());
	}
	
	@isTest static void searchValueContactTest() {
        Contact con = new Contact(LastName='test', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
        insert con;
       
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = con.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 'test';
        Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(1,incontroller.contactList.size());
	}
	//
	@isTest static void searchValueNotInAccTest() {
		Account acc = new Account();
        acc.Name = 'test';
        insert acc;
       
       	PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = acc.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 't';
        Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(0,incontroller.accountList.size());
	}
	
	@isTest static void searchValueNotInLeadTest() {
        Lead l = new Lead(FirstName = 'test' ,LastName='test',Company='abc',Status = 'Open - Not Contacted');
        insert l;
        
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = l.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 't';
        Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(0,incontroller.leadList.size());
	}
	
	@isTest static void searchValueNotInOppTest() {
        Opportunity opp = new Opportunity(Name='test',CloseDate= Date.newInstance(2015, 2, 1),StageName= 'Closed Won');
        insert opp;
        
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();          
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = opp.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 't';
		Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(0,incontroller.opportunityList.size());
	}
	
	@isTest static void searchValueNotInContactTest() {
        Contact con = new Contact(LastName='test', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
        insert con;
       
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        Id [] fixedSearchResults= new Id[1];
        fixedSearchResults[0] = con.Id;
        Test.setFixedSearchResults(fixedSearchResults);
        incontroller.searchString = 't';
        Test.startTest();
        incontroller.explore();
        Test.stopTest();
        system.assertEquals(0,incontroller.contactList.size());
	}
}
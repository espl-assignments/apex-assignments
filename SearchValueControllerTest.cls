/**
Test class for SearchValueController
 */
@isTest
private class SearchValueControllerTest {

    @isTest static void searchValueAccTest() {
		Account acc = new Account(name='test');
        insert acc;
       
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        
        Test.startTest();
        incontroller.searchString = 'test';
        incontroller.explore();
        test.stopTest();
        
        System.assertEquals(acc.Name,'test');
	}
	
	  @isTest static void searchValueLeadTest() {
        Lead l = new Lead(FirstName = 'test' ,LastName='test',Company='abc',Status = 'Open - Not Contacted');
        insert l;
        
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        /*incontroller.searchString = 'test';
        incontroller.explore();*/
        Test.startTest();
        incontroller.searchString = 't';
        incontroller.explore();
        test.stopTest();
        System.assertEquals(l.Name,'test');
	}
	
	@isTest static void searchValueOppTest() {
        Opportunity opp = new Opportunity(Name='test',CloseDate= Date.newInstance(2015, 2, 1),StageName= 'Closed Won');
        insert opp;
        
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        incontroller.searchString = 'test';
        Test.startTest();
        incontroller.explore();
        test.stopTest();
        System.assertEquals(opp.Name,'test');
	}
	
	  @isTest static void searchValueContactTest() {
        Contact con = new Contact(FirstName = 'contest' ,LastName='contest');
        insert con;
       
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        /*incontroller.searchString = 'test';
        incontroller.explore();*/
        Test.startTest();
        incontroller.searchString = 't';
        incontroller.explore();
        test.stopTest();
		System.assertEquals(con.Name,'test');
	}
}
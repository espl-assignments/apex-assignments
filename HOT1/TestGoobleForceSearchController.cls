/**
Test class for GoobleForceSearchController.
 */
@isTest
private class TestGoobleForceSearchController {

    static testMethod void testSearch() {
        PageReference pageRef = Page.GoobleForceSearch;
     	Test.setCurrentPageReference(pageRef);
        GoobleForceSearchController incontroller = new GoobleForceSearchController();
        Test.startTest();
        Test.setMock(HttpcalloutMock.class, new MockGenerator_Test());
        incontroller.searchstring = 'test';
        incontroller.searchText();
        incontroller.displayResult();
    	Test.stopTest();
        system.assertEquals('test',incontroller.searchstring);
    }
    
	static testMethod void testSearchNegative() {
        PageReference pageRef = Page.GoobleForceSearch;
     	Test.setCurrentPageReference(pageRef);
        GoobleForceSearchController incontroller = new GoobleForceSearchController();
        Test.startTest();
        Test.setMock(HttpcalloutMock.class, new MockGenerator_Test());
        incontroller.searchstring = ' ';
        incontroller.searchText();
        incontroller.displayResult();
    	Test.stopTest();
        system.assertEquals(' ',incontroller.searchstring);
    }
    
    static testMethod void testShowSearchqueries() {
    	UserSearchQuery__c us = new UserSearchQuery__c(SearchText__c = 'test');
    	ApexPages.StandardController sc = new ApexPages.StandardController(us);
    	GoobleForceSearchController incontroller = new GoobleForceSearchController(sc);
        PageReference pageRef = Page.GoobleForceSearch;
     	Test.setCurrentPageReference(pageRef);
        Test.startTest();
        Test.setMock(HttpcalloutMock.class, new MockGenerator_Test());
    	Test.stopTest();
        System.assertEquals(0,incontroller.queries.size());
    }
}
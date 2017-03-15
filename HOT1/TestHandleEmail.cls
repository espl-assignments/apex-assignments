/**
Test class for HandleEmail class.
 */
@isTest
private class TestHandleEmail {
	static testMethod void emailHandlingPositiveTest() {
		Search_Settings__c ss = new  Search_Settings__c ();
    	ss.Keyword__c = 'Search: ';
    	ss.No_of_words__c = 1;
    	insert ss;
		UserEmail__c ue = new UserEmail__c(Body__c = 'Search: test', Subject__c = 'test');
		Test.startTest();
		insert ue;
		Test.setMock(HttpcalloutMock.class, new MockGenerator_Test());
		Test.stopTest();
		System.assertEquals('Search: test',ue.Body__c);
    }
    
    	static testMethod void emailHandlingNegativeTest() {
		Search_Settings__c ss = new  Search_Settings__c ();
    	ss.Keyword__c = 'Search: ';
    	ss.No_of_words__c = 1;
    	insert ss;
		UserEmail__c ue = new UserEmail__c(Body__c = 'test', Subject__c = 'test');
		Test.startTest();
		insert ue;
		Test.setMock(HttpcalloutMock.class, new MockGenerator_Test());
		Test.stopTest();
		System.assertNotEquals('Search: test',ue.Body__c);
    }
}
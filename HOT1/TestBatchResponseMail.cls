/**
Test class for BatchResponseMail
 */
@isTest
private class TestBatchResponseMail {

    static testMethod void executeBatchResponseMail() {
    	Search_Settings__c ss = new  Search_Settings__c ();
    	ss.Keyword__c = 'Search: ';
    	ss.No_of_words__c = 1;
    	insert ss;
    	List<Contact> con = ContactsDataFactory.createContacts(1);
    	insert con;
    	UserSearchQuery__c us = new UserSearchQuery__c(SearchText__c = 'Search: test');
     	UserEmail__c ue = new UserEmail__c(Body__c = 'Search: test', Subject__c = 'test',IsResponseSend__c = false , UserSearch_Query__c = us.id ,ContactId__c = con[0].id);
     	UserSearchQueryResult__c usr = new UserSearchQueryResult__c(Name = 'test', Description__c = 'test', URL__c = 'www.test.com', Title__c = 'test',User_SearchQuery__c = us.id);
        Test.startTest();
        insert ue;
        Test.setMock(HttpcalloutMock.class, new MockGenerator_Test());
		BatchResponseMail b = new BatchResponseMail();
		Database.executeBatch(b);
        Test.stopTest();	
        System.assertEquals(ue.UserSearch_Query__c,us.id );
     }
}
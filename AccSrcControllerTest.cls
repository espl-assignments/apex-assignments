/*
Test class for AccSrcController
 */
@isTest
private class AccSrcControllerTest {

    @isTest static void searchAccountTest() {
		List<Account> accountSettings = AccountDataFactory.createAccounts(1);
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        incontroller.searchString = 'T';
        Test.startTest();
        	incontroller.search();
        Test.stopTest();
        System.assertNotEquals(2,incontroller.accountList.size());
	}
	
	    @isTest static void searchAccountsTest() {
		List<Account> accountSettings = AccountDataFactory.createAccounts(5);
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        incontroller.searchString = 'a';
        Test.startTest();
        	incontroller.search();
        Test.stopTest();
        System.assertEquals(0,incontroller.accountList.size());
	}
	
	@isTest static void testClear() {
		List<Account> accountSettings = AccountDataFactory.createAccounts(1);
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        incontroller.searchstring = 'test';
        incontroller.search();
        Test.startTest();
        	incontroller.clear();
        Test.stopTest();
        system.assertEquals('',incontroller.searchString);
	}       

	@isTest static void testDisplayClear() {
		List<Account> accountSettings = AccountDataFactory.createAccounts(1);
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        incontroller.searchstring = 'test';
        Test.startTest();
        	 incontroller.search();
        	incontroller.display();
        Test.stopTest();
        system.assertEquals(0,incontroller.showAccount.size());
	} 
	
	@isTest static void testDeleteAccount() {
        Account acc = new Account(name='test');
        insert acc;
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        pageref.getparameters().put('accid',acc.id);
        pageref.getparameters().put('AlphaFilter','A');
        Test.startTest();
        boolean res= AccSrcController.delAccount(acc.id);
        Test.stopTest();
        system.assertEquals(true,res);
	}

	@isTest static void testAllAccountResults() {
        Account acc = new Account(name='test');
        insert acc;
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        pageref.getparameters().put('accid',acc.id);
        pageref.getparameters().put('AlphaFilter','All');
		Test.startTest();
			AccSrcController incontroller = new AccSrcController();
        Test.stopTest();
        system.assertEquals('All', incontroller.searchVar);
	}
}
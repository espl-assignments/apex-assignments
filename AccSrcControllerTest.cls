/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AccSrcControllerTest {

    @isTest static void searchAccountTest() {
        Test.startTest();
        Account acc = new Account(name='test');
        insert acc;
        test.stopTest();
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        incontroller.searchString = 'test';
        incontroller.search();
        incontroller.searchString.length();
        
        incontroller.searchString = 't';
        incontroller.search();
        incontroller.searchString.length();
	}
	
	
	@isTest static void testClear() {
        Test.startTest();
        Account acc = new Account(name='test');
        insert acc;
        test.stopTest();
        PageReference pageRef = Page.AccSrcPage;
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        incontroller.searchstring = 'test';
        incontroller.search();
        incontroller.clear();
        system.assertEquals('',incontroller.searchString);
	}       

	@isTest static void testDeleteAccount() {
        Test.startTest();
        Account acc = new Account(name='test');
        insert acc;
        test.stopTest();
        PageReference pageRef = Page.AccSrcPage;
        pageref.getparameters().put('accid',acc.id);
        pageref.getparameters().put('AlphaFilter','A');
        Test.setCurrentPageReference(pageRef);
        AccSrcController incontroller = new AccSrcController();
        system.assertEquals(true,AccSrcController.delAccount(acc.id));
	}

}
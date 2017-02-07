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
private class SearchValueControllerTest {

    @isTest static void searchValueAccTest() {
        Test.startTest();
        Account acc = new Account(name='test');
        insert acc;
        test.stopTest();
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        incontroller.searchString = 'test';
        incontroller.explore();
        incontroller.searchString.length();
	}
	
	  @isTest static void searchValueLeadTest() {
        Test.startTest();
        Lead l = new Lead(FirstName = 'test' ,LastName='test',Company='abc',Status = 'Open - Not Contacted');
        insert l;
        test.stopTest();
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        incontroller.searchString = 'test';
        incontroller.explore();
        
        incontroller.searchString = 't';
        incontroller.explore();
        incontroller.searchString.length();
	}
	
	@isTest static void searchValueOppTest() {
        Test.startTest();
        Opportunity opp = new Opportunity(Name='test',CloseDate= Date.newInstance(2015, 2, 1),StageName= 'Closed Won');
        insert opp;
        test.stopTest();
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        incontroller.searchString = 'test';
        incontroller.explore();
        incontroller.searchString.length();
	}
	
	  @isTest static void searchValueContactTest() {
        Test.startTest();
        Contact con = new Contact(FirstName = 'contest' ,LastName='contest');
        insert con;
        test.stopTest();
        PageReference pageRef = Page.SearchValuePage;
        Test.setCurrentPageReference(pageRef);
        SearchValueController incontroller = new SearchValueController();
        incontroller.searchString = 'test';
        incontroller.explore();
        
        incontroller.searchString = 't';
        incontroller.explore();
        incontroller.searchString.length();
	}
}
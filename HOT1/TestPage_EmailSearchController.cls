/**
Test class for Page_EmailSearchController
 */
@isTest
private class TestPage_EmailSearchController {

    static testMethod void testgetResults() {
        PageReference pageRef = Page.Page_EmailSearch;
     	Test.setCurrentPageReference(pageRef);
     	Page_EmailSearchController pagecontroller = new Page_EmailSearchController();
     	ApexPages.currentPage().getParameters().get('response');
     	Test.startTest();
     	system.assertEquals(null,pagecontroller.getResults());
     	Test.stopTest();
    }
}
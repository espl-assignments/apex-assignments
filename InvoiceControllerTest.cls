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
private class InvoiceControllerTest {

  /* Test cases
  * 1.Proper Account name populated in Invoice_Statement__c.
  * 2.Checking getBillRecord() for finding correct sum.
  */

  @isTest static void checkAccount() {
    // Implement test code
      test.startTest();
      Account acc=new Account(name='chiragtest');
      insert acc;
      Invoice_Statement__c invoice=new Invoice_Statement__c(Account_Name__c= acc.id);
      insert invoice;
      test.stopTest();
      Invoice_Statement__c i=[select Account_Name__r.Name from Invoice_Statement__c where
             Account_Name__r.name='test'];
      system.assertEquals('test',i.Account_Name__r.name);
      system.assertEquals(acc.id,i.Account_Name__r.id);
  }

  @isTest static void checkSum() {
    // Implement test code
    Test.startTest();
    Account acc=new Account(name='test1');
    insert acc;
    Invoice_Statement__c invoice=new Invoice_Statement__c(Account_Name__c=acc.id);
    insert invoice;
    Line_Item__c item1=new Line_Item__c(Invoice_Statement__c=invoice.id,
    Item__c='watch',Unit_Price__c=50,Unit_Sold__c=2);
    insert item1;
    Line_Item__c item2=new Line_Item__c(Invoice_Statement__c=invoice.id,
    Item__c='watch2',Unit_Price__c=100,Unit_Sold__c=2);
    insert item2;
    test.stopTest();
    PageReference pageRef = Page.InvoicePage;
     Test.setCurrentPageReference(pageRef);
     //InvoiceController invoicetest = new InvoiceController();

    ApexPages.StandardController sc = new ApexPages.StandardController(invoice);
    InvoiceController incontroller = new InvoiceController(sc);
    incontroller.getBillRecord();
    ApexPages.currentPage().getParameters().put('id',invoice.id);
    AggregateResult[] groupedResults = [SELECT SUM(Amount__c)total FROM Line_Item__c
                                        where Invoice_Statement__c= :ApexPages.currentPage(). getParameters().get('id')];
    Double amount = (Double)groupedResults[0].get('total');
    system.assertEquals(300,amount);

  }

}
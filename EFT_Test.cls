/*EFT_Test class for EFT_Trigger*/
@isTest
 private class EFT_Test {

	 @isTest static void testMethod1() {
	 	EFT_Transaction_Status__c testeft = new EFT_Transaction_Status__c(Method_Name__c = 'Credit Card Address Verify', Transaction_Status__c = 'Declined', Sales_Header_Details__c = 'Hello');
	 	//EFT_Trigger_Helper.createCaseWhenNeeded();
		// Verify that the case was updated in the database.
		Test.startTest();
     		Case updatedCases = [SELECT Subject FROM Case WHERE Priority = 'High'];
     	Test.stopTest();
     	System.assertEquals('Address Did Not Verify', updatedCases.Subject);
	 }
}
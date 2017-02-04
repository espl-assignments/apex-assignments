/*EFT_Test class for EFT_Trigger*/
@isTest
 private class EFT_Test {

	 @isTest static void testMethod1() {
	 	Sales_Header__c salesObj = new Sales_Header__c(Status__c = 'Open',Name = 'test');
	 	insert salesObj;
	 	EFT_Transaction_Status__c eftObj = new EFT_Transaction_Status__c(Method_Name__c = 'Credit Card Address Verify' , Transaction_Status__c = 'Declined');
	 	test.startTest();
	 		insert eftObj;
	 	test.stopTest();
	 	List<Case> testCase = new List<Case>([Select Id,Reason,Priority,Subject From Case]);
	 	Integer len = testCase.size();
	 	System.assertEquals(1,len);
	 }
}
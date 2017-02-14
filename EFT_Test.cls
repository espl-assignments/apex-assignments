/*EFT_Test class for EFT_Trigger*/
@isTest
 private class EFT_Test {

	 @isTest static void testCaseCreation() {
	 	Sales_Header__c salesObj = new Sales_Header__c(Status__c = 'Open',Name = 'test');
	 	insert salesObj;
	 	
	 	EFT_Transaction_Status__c eftObj = new EFT_Transaction_Status__c(Sales_Header_Details__c = salesObj.id ,Method_Name__c = 'Credit Card Address Verify' , Transaction_Status__c = 'Declined');
		test.startTest();
	 	insert eftObj;
		
	 	eftObj = [Select id, Method_Name__c,Transaction_Status__c from EFT_Transaction_Status__c 
	 				where Transaction_Status__c =: eftObj.Transaction_Status__c];
	 	test.stopTest();
	 	
	 	Case testCase =[Select Id,Reason,Priority,Subject,Transaction_Status__c From Case where 
	 						Transaction_Status__c =: eftObj.Transaction_Status__c];
	 					
		System.assertEquals(testCase.Transaction_Status__c,eftObj.Transaction_Status__c);
	 }
	 
	 @isTest static void checkCaseIsCreatedOrNot() {
	 	Sales_Header__c salesObj = new Sales_Header__c(Status__c = 'close',Name = 'test');
	 	insert salesObj;
	 	
	 	EFT_Transaction_Status__c eftObj = new EFT_Transaction_Status__c(Sales_Header_Details__c = salesObj.id,Method_Name__c = 'Credit Card Address Verify' , Transaction_Status__c = 'Declined');
		test.startTest();
	 	insert eftObj;
		
	 	eftObj = [Select id, Method_Name__c,Transaction_Status__c from EFT_Transaction_Status__c 
	 				where Transaction_Status__c =: eftObj.Transaction_Status__c];
	 	test.stopTest();
	 	
	 	Case testCase =[Select Id,Reason,Priority,Subject,Transaction_Status__c From Case where 
	 						Transaction_Status__c =: eftObj.Transaction_Status__c];
	 					
		System.assertEquals(testCase.Transaction_Status__c,eftObj.Transaction_Status__c);
	 }
}
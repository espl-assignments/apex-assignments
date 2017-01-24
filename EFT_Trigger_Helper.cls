public with sharing class EFT_Trigger_Helper {
	public static void createCaseWhenNeeded(List<EFT_Transaction_Status__c> eft_trans){
		List<Case> cases = new List<Case>();
		List<EFT_Transaction_Status__c> eft_fields = new List<EFT_Transaction_Status__c> 
													([Select Method_Name__c, 
													Transaction_Status__c, 
													Transaction_Date__c, 
													Sales_Header_Details__c, 
													Sales_Header_Details__r.Id,
													Sales_Header_Details__r.Name,
													Sales_Header_Details__r.Status__c, 
													Sales_Header_Details__r.Contact_Name__c, 
													Sales_Header_Details__r.Bill_To_Customer__c 
													from EFT_Transaction_Status__c]);
		
		for (EFT_Transaction_Status__c eft: eft_fields) {
			if(eft.Sales_Header_Details__r.Status__c == 'Open'){
				System.debug('Check Status');
			
				if ((eft.Method_Name__c == 'Credit Card Address Verify') && (eft.Transaction_Status__c == 'Declined')) {
					Case c = new Case();
					c.AccountId = eft.Sales_Header_Details__r.Bill_To_Customer__c ;
					c.ContactId = eft.Sales_Header_Details__r.Contact_Name__c ;
					c.Subject = 'Address Did Not Verify';
					c.Type = 'Address Did Not Verify';
					c.Reason = 'Address Did Not Verify';
					c.Transaction_Status__c = eft.Transaction_Status__c ; 
					c.Order_Date__c = eft.Transaction_Date__c;
					c.Priority = 'High';
					c.Origin = 'Internal';
					//c.Open_Sales_Order__c = eft.Sales_Header_Details__r;
					c.Sales_Order_Number__c = eft.Sales_Header_Details__r.Name;
					cases.add(c);
				}
			}
		}
		insert cases;
	}
}
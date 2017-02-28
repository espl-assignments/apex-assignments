/*
ABC Containers require the ability to automatically associate a Contact created in their Salesforce Instance 
with the respective Account based on the email domain specified in the primary email address of the Contact. 
The association should happen real time as soon as a Contact record is created within the system.

*/

trigger AssociateContactAccount on Contact (before insert) {
	
	CheckDuplicateContactsHelper chelper = new CheckDuplicateContactsHelper();
	Trigger_Settings__c ts = Trigger_Settings__c.getInstance( UserInfo.getUserID() );
	
	// To Disable_AssociateContactAccount_Trigger by using custom settings.
	if( ts.Disable_AssociateContactAccount_Trigger__c) 
		return;
	
    if(Trigger.isBefore && Trigger.isInsert)
    {
    	AssociateContactAccountHelper helper = new AssociateContactAccountHelper();
        //call helper method
        helper.associateContactToAccount(Trigger.new);
    }
}
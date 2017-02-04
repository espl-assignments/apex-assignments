/*
Contact Duplicate Check Trigger:
* Create a new Trigger on Contact that will check for duplicates before allowing a new record into the database. 
* Validate against the email address and phone number fields. 
* An error be thrown with the error message “A Contact with the same email address or phone number already exists in system.”
* Should be bulk safe in nature and must be capable of handling at least 200 records at a time.
*/

trigger CheckDuplicateContacts on Contact (before insert) { 
	
	Trigger_Settings__c ts = Trigger_Settings__c.getInstance( UserInfo.getUserID());
	
	// Disable the trigger through custom settings.
	if( ts.Disable_Trigger__c ) 
	{
		return;
	}
	
	CheckDuplicateContactsHelper chelper = new CheckDuplicateContactsHelper();
	chelper.validateContact(Trigger.new);
}
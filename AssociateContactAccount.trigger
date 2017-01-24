/*
ABC Containers require the ability to automatically associate a Contact created in their Salesforce Instance 
with the respective Account based on the email domain specified in the primary email address of the Contact. 
The association should happen real time as soon as a Contact record is created within the system.

*/

trigger AssociateContactAccount on Contact (before insert) {
	AssociateContactAccountHelper helper = new AssociateContactAccountHelper();
    if(Trigger.isBefore && Trigger.isInsert)
    {
        //call helper method
        helper.associateContactToAccount(Trigger.new);
    }
}
/*
1.System.debug the following statements for any object 
a)Trigger.New b) Trigger.Old c)Trigger.NewMap d)Trigger.oldMap
*/

trigger SampleAccTrigger on Account (before update) {
	Trigger_Settings__c ts = Trigger_Settings__c.getInstance( UserInfo.getUserID() );
	// Disable the trigger through custom settings.
	if( ts.Disable_SampleAccTrigger__c ) 
		return;
	
	List<Account> newTrigger  = Trigger.new;
   	System.debug(newTrigger);
   	map<Id,Account> newTriggerMap = Trigger.newMap;
   	System.debug(newTriggerMap);

	List<Account> oldTrigger  = Trigger.old;
   	System.debug(oldTrigger);
   	map<Id,Account> oldTriggerMap = Trigger.oldMap;
   	System.debug(oldTriggerMap);
}
/*Problem Statement:
System.debug the following statements for all events (Before & After)
a)Trigger.New b) Trigger.Old c)Trigger.NewMap d)Trigger.oldMap 
*/


trigger AccountTrigger on Account (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	Trigger_Settings__c ts = Trigger_Settings__c.getInstance( UserInfo.getUserID() );
	// Disable the trigger through custom settings.
	if( ts.Disable_AccountTrigger__c){
		return;
	}
		
	AccountTriggerClass accObject = new AccountTriggerClass(); // AccountTriggerClass
    	
	if(Trigger.isInsert)
	{
		if(Trigger.isBefore)
		{
    		accObject.triggerContextVar();
	    } 
	    else if(Trigger.isAfter)
	    {
	 		accObject.triggerContextVar();   	
	    }
    }
    
    if(Trigger.isDelete)
    {
    	if(Trigger.isBefore)
    	{
    		accObject.triggerContextVar();
	    }
	    else if(Trigger.isAfter)
	    {
	 		accObject.triggerContextVar();   	
	    }
    }
    
    if(Trigger.isUpdate)
    {
    	if(Trigger.isBefore)
    	{
    		accObject.triggerContextVar();
	    } 
	    else if(Trigger.isAfter){
	 		accObject.triggerContextVar();   	
	    }
    }
}
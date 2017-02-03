/*
3.Write a Trigger on Account which will create the clone record. 
*/

trigger AccountCloneTrigger on Account (before insert) {
	Trigger_Settings__c ts = Trigger_Settings__c.getInstance( UserInfo.getUserID() );
	// Disable the trigger through custom settings.
	if(ts.Disable_AccountCloneTrigger__c) 
		return;
	
	if(RecursiveTrigger.runOnce()){
		List<Account> clone = new List<Account> ();
		for(Account acc : Trigger.new){
			clone.add(new Account(Name = acc.Name, BillingCity = acc.BillingCity));
		}
		insert clone; 
	}    
}
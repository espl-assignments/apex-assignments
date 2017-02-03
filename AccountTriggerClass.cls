//Helper Class for AccountTrigger 

public with sharing class AccountTriggerClass {
	public void triggerContextVar(){
		System.debug(Trigger.new);
		System.debug(Trigger.old);
		System.debug(Trigger.newMap);
		System.debug(Trigger.oldMap);
	}    
}
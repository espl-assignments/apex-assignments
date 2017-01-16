trigger SampleAccTrigger on Account (before update) {
	List<Account> newTrigger  = Trigger.new;
   	System.debug(newTrigger);
   	map<Id,Account> newTriggerMap = Trigger.newMap;
   	System.debug(newTriggerMap);

	List<Account> oldTrigger  = Trigger.old;
   	System.debug(oldTrigger);
   	map<Id,Account> oldTriggerMap = Trigger.oldMap;
   	System.debug(oldTriggerMap);
}
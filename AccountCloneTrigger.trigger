trigger AccountCloneTrigger on Account (before insert) {
	if(RecursiveTrigger.runOnce()){
		List<Account> clone = new List<Account> ();
		for(Account acc : Trigger.new){
			clone.add(new Account(Name = acc.Name, BillingCity = acc.BillingCity));
		}
		insert clone; 
	}    
}
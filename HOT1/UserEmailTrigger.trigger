trigger UserEmailTrigger on UserEmail__c (after insert) {
	String json_String = json.serialize(Trigger.new[0]);
	System.debug('String is '+json_String);
	Search_Settings__c ss = Search_Settings__c.getInstance( UserInfo.getUserID());
	if(json_String.contains(ss.Keyword__c)){
		HandleEmail.getResults(json_String);
	}
}
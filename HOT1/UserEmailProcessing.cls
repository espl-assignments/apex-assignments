global class UserEmailProcessing implements Messaging.InboundEmailHandler {
	global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope) {
		Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
		UserEmail__c mail = new UserEmail__c();
		UserSearchQuery__c query = new UserSearchQuery__c();
		Contact contact;
    	
		query.Name = email.fromname;
		query.searchText__c = email.plainTextBody;
		insert query;
		
		mail.Name = email.fromname;
		mail.Subject__c = email.subject;
		mail.Body__c = email.plainTextBody;
		
		List<Contact> cts = [select id,Email from Contact where email =: envelope.fromAddress];
		
		if(cts.size() == 0) {
			contact = new Contact();
			contact.FirstName = email.fromname.substring(0,email.fromname.indexOf(' '));
			contact.LastName = email.fromname.substring(email.fromname.indexOf(' '));
			contact.Email =  envelope.fromAddress;
			insert contact;
			mail.ContactId__c = contact.id;
		}
		else {
			mail.ContactId__c = cts[0].id;
		}
		mail.UserSearch_Query__c = query.id;
		insert mail;
		return result;
	}
}
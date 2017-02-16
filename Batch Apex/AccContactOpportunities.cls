/*
A. Collection of Closed Won Opportunities 
	1. The Primary contact associated with an account needs to know which all are the closed won opportunities for his account per day.
	2. Create a process which will run every day in the midnight & collect all the Closed won opportunities of that account in a day & send an email to Primary Contact.
	3. The email body should contain the Opportunity Name & it's respective amount with the aggregated amount in the end. 
*/

global class AccContactOpportunities implements Database.Batchable < sObject > , Database.Stateful{
	Double total = 0;
    List<Account> accounts;
    
    map <Id,List <Opportunity>> accountOpportunityMap = new map <Id,List <Opportunity>> ();
    map <Id,List <Opportunity>> contactOpportunityMap = new map <Id,List <Opportunity>> ();
    map <Id,String> contactEmailMap = new map <Id,String> ();
    map <Id,Double> contactAmountMap = new map <Id,Double> ();

    global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator([SELECT Id,AccountId,Name,Amount FROM Opportunity WHERE StageName = 'Closed Won' and CreatedDate = TODAY]);
    }

    global void execute(Database.BatchableContext BC, List <Opportunity> result) {
        for( Opportunity opp : result) {
            if(!accountOpportunityMap.containsKey(opp.AccountId)) {
                accountOpportunityMap.put(opp.AccountId,new List <Opportunity> {opp});
            }
            else {
                List<Opportunity> opportunity = accountOpportunityMap.get(opp.AccountId);
                opportunity.add(opp);
                accountOpportunityMap.put(opp.AccountId,opportunity);
            }
        }

        accounts = [SELECT Id,(SELECT Id,Email from Contacts where Primarycontact__c = true) FROM Account where id In : accountOpportunityMap.keyset()];

        for(Account obj : accounts) {
            Id contactId = obj.Contacts[0].id;
            List <Opportunity> opportunities = accountOpportunityMap.get(obj.id);
            contactOpportunityMap.put(contactId,opportunities);
        }

        //System.debug('To Display '+accountOpportunityMap);

        for(Account obj : accounts) {
            Id contactId = obj.Contacts[0].id;
            //System.debug('To Display AccContacts '+contactId);
            List<Opportunity> opportunities = accountOpportunityMap.get(obj.Id);
            
            //System.debug('To Display AccOpportunities'+opportunities);
            for(Opportunity opp:opportunities) {
				total = total + opp.Amount;
                contactAmountMap.put(contactId,total);
            }
        }

        for(Account obj : accounts) {
			Id contactId = obj.Contacts[0].id;
			contactEmailMap.put(contactId,obj.Contacts[0].Email);
		}
	}
	
    global void finish(Database.BatchableContext BC) {
    	String oppNames;
    	String messageBody;
        for(Id opp:contactOpportunityMap.keySet()) {
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            Double oppAmount = contactAmountMap.get(opp);
            
            String email = contactEmailMap.get(opp);
            
            String[] toAddress = New String[] {email};
            mail.setToAddresses(toAddress);
            
            mail.setSubject('ALL Closed Won Opportunities');

			messageBody = ('<html><body> \n Hi: \n');
			for(Opportunity contactOpportunityValues : contactOpportunityMap.get(opp)){
				messageBody += ('\nName: ');
            	messageBody += contactOpportunityValues.Name + ('\tAmount: ');
            	messageBody += contactOpportunityValues.Amount;
			}
			
			messageBody += ('\nTotal Amount: ');
			
			messageBody += oppAmount + ('</body> </html>');
        	
			mail.setHtmlBody(messageBody);
			
			Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {mail};
			//Messaging.SendEmailResult[] results= Messaging.sendEmail(messages);
			System.debug('Mail:' + messages);
     	}
    }
}
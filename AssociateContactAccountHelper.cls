/***********************************************************************************
 * Class : AssociateContactAccountHelper
 * Created By : Pranali Mahajan
 -----------------------------------------------------------------------------------
 * Description : AssociateContactAccountHelper class
 -----------------------------------------------------------------------------------
 * Version History:
 * Version    Developer Name    Date          Detail Features
 * 1.0        Pranali Mahajan                Intial Development
 **********************************************************************************
 ABC Containers require the ability to automatically associate a Contact created in their Salesforce Instance 
 with the respective Account based on the email domain specified in the primary email address of the Contact. 
 The association should happen real time as soon as a Contact record is created within the system. */

public with sharing class AssociateContactAccountHelper {
	public void associateContactToAccount(List<Contact> con){
		List<String> contactEmaildomains = new List<String>();
		
        for(Contact contactlist:con)
    	{
        	contactEmaildomains.add(contactlist.Email.split('@').get(1));
    	}
    	
        List<Account> accountlist = [SELECT Id, Domain__c FROM Account WHERE Domain__c IN :contactEmaildomains];
        
		Map<String, Id> domainsMap = new Map<String, Id>();
		
		for(Account acc: accountlist) 
        {
        	domainsMap.put(acc.Domain__c, acc.Id);
        }
        
        for(Contact cont: con)
        {
        	String domain = cont.Email.split('@').get(1);
        	
            if(domainsMap.containsKey(domain)) 
            {
                cont.AccountId = domainsMap.get(domain);
            }
        } 
	}
}
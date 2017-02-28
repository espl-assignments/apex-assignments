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
	public void associateContactToAccount(List<Contact> contactList){
		
		Map<String, List<Contact>> contactDomainToContactListMap = new Map<String, List<Contact>> ();
		String domain;
		for(Contact con :contactList){
			domain = con.Email.split('@').get(1);
			
				if(contactDomainToContactListMap.containskey(domain)){
     				contactDomainToContactListMap.get(domain).add(con);
				}
				else{
     				contactDomainToContactListMap.put(domain, new List<Contact>{con});
				}
		}
		
		List<Account> accountlist = [SELECT Id, Domain__c FROM Account WHERE Domain__c =:domain];
		Map<String, Id> accountDomainMap = new Map<String, Id>();
		
		for(Account acc: accountlist) 
        {
        	accountDomainMap.put(acc.Domain__c, acc.Id);
        }
        
        for(String accountDomain :accountDomainMap.keySet()){
    		for(Contact cont :contactDomainToContactListMap.get(accountDomain)){
        		cont.AccountId = accountDomainMap.get(accountDomain);
    		}
		}
	}
}
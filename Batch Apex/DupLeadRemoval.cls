/*
B. Removal of duplicate Leads 
1. During the Campaigning, It might happen that representative creates duplicate leads in an org. 
2. So admin want to build a process which will run every 3 hours/day & remove the duplicate leads from the org. 
3. The criteria to find the duplicate records should be configurable. 
Ex. If there are two leads in a system with same Email address then keep the first lead entry & remove all the other leads. 
So the field like Email, Name which will be deciding the uniqueness should be configurable.
*/

public with sharing class DupLeadRemoval implements Database.Batchable < sObject >, Database.Stateful{
	
	String query = 'Select id,Name,Email from Lead order by CreatedDate'; //SOQL Query to fetch the lead records.
	public Database.QueryLocator start(Database.BatchableContext BC)  {
      return Database.getQueryLocator(query);  //Pass the query for execution.
      }
	
	public void execute(Database.BatchableContext bc, List <Lead> leadscope) {
		Set<String> leadObj = new Set<String>(); 
		List<Lead> dupList = new List<Lead>();
		
		//Custom settings to decide the criteria to find the duplicate records.
		DupLeadRemovalSettings__c dup = DupLeadRemovalSettings__c.getInstance(UserInfo.getUserID());
	
		//If Name and Email both are selected as the criteria to find the duplicate records.	
		if(dup.Select_Name__c == true && dup.Select_Email__c == true ) {
			for(Lead l : leadscope)
			{
    			if(leadObj.contains(l.Name) && leadObj.contains(l.Email))
    			{
        			dupList.add(l);	//If record with duplicate name and email is present add it to the duplicate record list.
    			}
    			else
    			{
        			leadObj.add(l.Name);
        			leadObj.add(l.Email);
    			}
			}
			System.debug(leadObj);
			System.debug(dupList);
			delete dupList;	//delete the list of duplicate records
			System.debug(dupList);
		}
	
		//If Name is selected as the criteria to find the duplicate records.
		else if(dup.Select_Name__c == true) {
			for(Lead l : leadscope)
			{
    			if(leadObj.contains(l.Name))
    			{
        			dupList.add(l); //If record with duplicate name is present add it to the duplicate record list.
    			}
    			else
    			{
        			leadObj.add(l.Name); 
    			}
			}
			System.debug(leadObj);
			System.debug(dupList);
			delete dupList; //delete the list of duplicate records
			System.debug(dupList);
		}
		
		//If Email is selected as the criteria to find the duplicate records.
		else if(dup.Select_Email__c == true) {
			for(Lead l : leadscope)
			{
    			if(leadObj.contains(l.Email))
    			{	
        			dupList.add(l);	//If record with duplicate email is present add it to the duplicate record list.
    			}
    			else
    			{
        			leadObj.add(l.Email);
    			}
			}
			System.debug(leadObj);
			System.debug(dupList);
			delete dupList; //delete the list of duplicate records
			System.debug(dupList);
		}		
	}
	
	public void finish(Database.BatchableContext bc) {
	}
}
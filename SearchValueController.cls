public with sharing class SearchValueController {
    
    public List<Opportunity> opportunityList {get;set;}
    public List<Contact> contactList{get;set;}
    public List<Account> accountList{get;set;}
    public List<Lead> leadList{get;set;}
    
    public String searchString{get;set;}

    public SearchValueController(){ }
    
    public void explore(){
        opportunityList = New List<Opportunity>();
        contactList = New List<Contact>();
        accountList = New List<Account>();
        leadList = New List<Lead>();
        
        if(searchString.length() > 1){
            String searchStrings = searchString+'*';
            String searchQuery = 'FIND \'' + searchStrings + '\' IN NAME FIELDS RETURNING  Account (Id,Name), Contact(FirstName, LastName, Name), Lead(FirstName, LastName, Name), Opportunity(Name)';
            List<List <sObject>> searchList = search.query(searchQuery);
            accountList = ((List<Account>)searchList[0]);
            contactList  = ((List<contact>)searchList[1]);
            leadList = ((List<Lead>)searchList[2]);
            opportunityList = ((List<Opportunity>)searchList[3]);
            if(accountList.size() == 0 && contactList.size() == 0 && leadList.size() == 0 && opportunityList.size() == 0){
                apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Sorry, no results returned with matching string..!!'));
       			return;
   			}
   		}	
   		else{
   			apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Please enter at least two characters..'));
   			return;
   		}	
    }   		
}
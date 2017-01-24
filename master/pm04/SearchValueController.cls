/*Assignment 1 

1. Create a Visualforce Page that will allow the user to search for the entered value across the following objects: 
• Accounts 
• Contacts 
• Leads 
• Opportunities 

2. Provide a text box that allows the user to enter a value to search. When the Search button is clicked the program should search across the above mentioned objects on the basis of whether of the following attributes and accordingly display the results. 

3. The search value should be compared with the following attributes on the above mentioned objects 
• Name 
• Last Name 
• First Name 

4. The search should not only look for exact matches i.e. If the search value entered is ‘test’ then records having the Name/Last Name/First Name as Test 1, Test 99 etc should also be returned. 

5. The page should only be partially updated, displaying the matching search results in different sections. 

6. Only relevant page blocks should be displayed. If a value matches the only Account and Lead records then only the page blocks for Account and Lead should be shown.
*/

public with sharing class SearchValueController {
	
	public List<Opportunity> opportunityList {get;set;}
 	public List<Contact> contactList{get;set;}
 	public List<Account> accountList{get;set;}
 	public List<Lead> leadList{get;set;}
 	
 	public String searchString{get;set;}

	public SearchValueController(){ }
	
	public void searchMethod(){
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
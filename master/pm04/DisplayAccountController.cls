/*
 Assignment 2
1. Query and display all the accounts in a tabular format on a visualforce page.
2. Display the columns name, phone, address.
3. Thename should be a hyperlink and on click of the link display contacts and opportunity records related to the account in different page block tables.
4. The page should be partially rendered and it should not reload.
*/

public with sharing class DisplayAccountController {

    public list<Contact> conlst { get; set;}
    public list<Account> accounts1 { get; set; }

    public PageReference selacc() {
    	string getId=apexpages.currentpage().getparameters().get('conlst');
    	accounts1=[select Id, Name, BillingCity, Phone, (select Id,LastName from Contacts) ,(select Name from Opportunities ) from Account where Id=:getId ];
        System.debug(accounts1);
      	return null;
	}
	public List<Account> acclst { get; set; }
   	public DisplayAccountController (){
    	acclst=[select id,Name from Account];
     	System.debug(acclst);
   }  
}
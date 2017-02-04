public with sharing class DisplayAccountController {

    public list<Contact> conlst { get; set;}
    public list<Account> accounts1 { get; set; }
    
    public PageReference selectAccount() {
    	string getId=apexpages.currentpage().getparameters().get('conlst');
    	accounts1=[select Id, Name, BillingCity, Phone,(select Id,LastName from Contacts),(select Name from Opportunities) from Account where Id=:getId];
        System.debug(accounts1);
      	return null;
	}
	
	public List<Account> accountList { get; set; }
	
   	public DisplayAccountController (){
    	accountList = [select id,Name from Account];
     	System.debug(accountList);
   }  
}
public with sharing class AccSrcController {
    
    public list<String> searchAlphabet {get;set;}
    public String searchVar {get;set;}
    public list<Account> showAccount {get;set;}
    public list<Account> acc {get;set;}
    public Integer sizes{get;set;}
    public list <Account> accountList {get;set;}  
    public string searchstring {get;set;}
    
    public AccSrcController(){
        searchAlphabet = new list<String> {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'All'};
        acc = new list<Account> ();
        acc = [SELECT Id, Name, Website, Phone from Account order by Name limit 25];
        searchVar = 'All';
        showAccount = new list<Account>();
        for(Account a : acc){
            if(searchVar.equals('All')){
                showAccount.add(a);
            }
            else{
                if(a.Name.startsWith(searchVar.toLowerCase())||a.Name.startsWith(searchVar)){
                    showAccount.add(a);
                }
            }           
        }   
        sizes = showAccount.size();
        accountList = new List<Account>();
    }
    
    public PageReference DisplayMethod(){
        return null;
    }   
    
    public PageReference display(){
        showAccount.clear();
        for(Account a : acc){
            if(searchVar.equals('All')){
            	showAccount.add(a);
            }
            else{
                if(a.Name.startsWith(searchVar.toLowerCase())||a.Name.startsWith(searchVar)){
                    showAccount.add(a);
                }
            }
        }   
        sizes = showAccount.size();
        return null;
    }
    
    public void search(){  
        if(searchString.length() > 2){
            String searchQuery= 'Select Id,Name,Phone,Website from Account where Name like \''+searchstring+'%\'';  
            accountList = Database.query(searchQuery); 
            Integer counter = accountList.size();
            
            if(counter > 0){
            	apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'Total Number of Records Processed: ' + counter);
            	apexpages.addmessage(msg); 
            }
            else if(counter == 0){
                apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Sorry, no results returned with matching string..!!'));
                return;
            }
        }   
        else{
            apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Please enter at least three characters..'));
            return;
        }       
    }
    
    public void clear(){  
        searchString = '';
        accountList.clear();
    }
    
    @RemoteAction
    public static boolean delAccount(Id accId) {
        Account account1 = [SELECT Id, Name FROM Account WHERE Id = : accId ];
        delete account1;
        return true;
    }
}
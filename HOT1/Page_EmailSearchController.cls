public with sharing class Page_EmailSearchController {
	
    public List<UserSearchQueryResult__c> result{get;set;}
    
    public String sid;
    
	public Page_EmailSearchController() {
  		sid=ApexPages.currentPage().getParameters().get('response');
  		getResults();
  	}

    public PageReference getResults() {
        result = [select Title__c , URL__c, Description__c from UserSearchQueryResult__c  where User_SearchQuery__c =: sid];
    	return null;
    }
}
public with sharing class GoobleForceSearchController {
    public List<UserSearchQuery__c> queries {get; set;}
    public id searchid {get;set;}
    public List<UserSearchQueryResult__c> resultQuery {get; set;}
    public String searchstring {get;set;}
    public Boolean showError{get;set;}
  	public GoobleForceSearchController() {}
  	
    public GoobleForceSearchController(ApexPages.StandardController controller) {
        showSearchQueries();
        showError = false;
    }

    public void showSearchQueries() {
        queries =[select SearchText__c from UserSearchQuery__c limit 20];
        
    }

    public PageReference displayResult() {
        //String searchqueryid =  System.currentPageReference().getParameters().get('searchid');
        resultQuery = [select Title__c , URL__c, Description__c from UserSearchQueryResult__c  where User_SearchQuery__c =: searchid];
    	return null;
    }
    
	public void searchText(){
		boolean isSearchAvailable;
		TextSearch newSearch = new TextSearch();
		if(String.isNotBlank(searchstring) && String.isNotEmpty(searchstring)){
			isSearchAvailable = newSearch.isAvailable(searchstring);
			if(!isSearchAvailable){
				resultQuery = newSearch.getTextSearchResults(searchstring);
			}
		}
		else{
			showError = true;
		}
	}
}
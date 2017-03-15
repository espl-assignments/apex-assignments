public with sharing class TextSearch {
	public String response;
    public TextSearch(){}
    
    public boolean isAvailable(String textQuery){
    	List<UserSearchQuery__c> queries = [Select SearchText__c from UserSearchQuery__c where SearchText__c =: textQuery];
    	if(queries.size()> 0){
    		return true;
    	}
    	else{
    		return false;
    	}
    }
    
    public List<UserSearchQueryResult__c> getTextSearchResults(String textQuery) {
    	ParseEmail parse = new ParseEmail();
    	UserSearchQuery__c query = new UserSearchQuery__c();
    	query.SearchText__c = textQuery;
    	query.Name = 'TextSearch '+textQuery;
    	textQuery = textQuery.trim();
        String searchQuery = textQuery.replace(' ','+');
        //String endPointUrl = 'https://www.google.com/search?q='+searchquery;
        String endPointUrl = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBv0GA3M6ZfJb93zgXP7JgVTrzPN3PsrWY&cx=007490645771623033590:pplo6fdba6y&q='+searchquery;
        Http http = new Http();
        HTTPRequest req = new HTTPRequest();
        HTTPResponse resp = new HTTPResponse();
        req.setEndpoint(endPointUrl);
        req.setMethod('GET');
        resp = http.send(req);
        response = resp.getBody();
        system.debug('Response='+response);
        List<UserSearchQueryResult__c> listResult = parse.parseResponse(response);
        return listResult;
    }
}
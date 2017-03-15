public with sharing class HandleEmail {
    public HandleEmail() {}
    
    @future (callout=true)
    public static void getResults(String query) {
    	Integer i;
    	String response='';
    	String searchQuery;
    	String endPointUrl;
    	ParseEmail parse = new ParseEmail();
    	Http http = new Http();
        HTTPRequest req = new HTTPRequest();
        HTTPResponse resp = new HTTPResponse();
        UserSearchQueryResult__c results =  new UserSearchQueryResult__c();
        UserEmail__c email = (UserEmail__c)Json.deserializeStrict(query,UserEmail__c.class);
        System.debug('object'+email);
        
        Search_Settings__c ss = Search_Settings__c.getInstance( UserInfo.getUserID());
        	
		List<String> bodyParts = new List<String>(email.Body__c.split(' '));
		System.debug(' textbody parts is '+bodyParts );
		
        //searchQuery = email.Body__c;
        //searchQuery = email.Body__c.replace(' ','+');
        for(i = 0 ; i < ss.No_of_words__c ; i++){
        	searchQuery = bodyParts[i+1];
        
        	System.debug('searchQuery: '+searchQuery);
        	//String endPointUrl = 'https://www.google.com/search?q='+searchquery;
        	endPointUrl = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBv0GA3M6ZfJb93zgXP7JgVTrzPN3PsrWY&cx=007490645771623033590:pplo6fdba6y&q='+searchquery;

        	req.setEndpoint(endPointUrl);
        	req.setMethod('GET');
        	resp = http.send(req);
        	response = resp.getBody();
        	system.debug('Response='+response);
        }
        List<UserSearchQueryResult__c> listResult = parse.parseResponse(response);
        System.debug('Output '+listResult);
        for(UserSearchQueryResult__c obj : listResult){
            obj.User_SearchQuery__c = email.UserSearch_Query__c;
           	obj.Name = email.Name;
        }
        insert listResult;
    }
}
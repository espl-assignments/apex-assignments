public with sharing class ParseEmail {
	public ParseEmail() {
  	}

	public List<UserSearchQueryResult__c> parseResponse(String response) {
        List<UserSearchQueryResult__c> searchList =  new List<UserSearchQueryResult__c>();
        UserSearchQueryResult__c result;
        JSONParser parser = JSON.createParser(response);
        System.JSONToken token;
        String text;
       	while ( parser.nextToken() != null) {
            if (parser.getCurrentToken()==JSONToken.FIELD_Name && parser.getText() == 'items') {
                while (parser.nextToken() != null) {
                    if(parser.getCurrentToken() == JSONToken.START_OBJECT) { //1
                        result = new UserSearchQueryResult__c();
                        while(parser.nextToken()!=JSONToken.END_OBJECT) {
                            if(parser.getCurrentToken() == JSONToken.FIELD_Name && parser.getText() == 'title') {
                                parser.nextToken();
                                result.Title__c = parser.getText();
                            }
                            else if(parser.getCurrentToken() == JSONToken.FIELD_Name && parser.getText() == 'link') {
                                 parser.nextToken();
                                result.URL__c = parser.getText();
                            }
                            else if(parser.getCurrentToken() == JSONToken.FIELD_Name && parser.getText() == 'snippet') {
                                parser.nextToken();
                                result.Description__c = parser.getText();
                            }

                        //token = parser.nextToken();
                        }
                        if(String.isNotBlank(result.Title__c) && String.isNotBlank(result.URL__c) && String.isNotBlank(result.Description__c)){
                        	searchList.add(result);
                        }
                    }
                }
            }
		 }
        System.debug('5555 '+searchList);
        return searchList;
        /*String newResponse = response.replace('"title"','Title__c');
        String newResponse = newResponse.replace('"link"','URL__c');
        String newResponse = newResponse.replace('"snippet"','Description__c');
        System.debug('response '+response);*/
    }
}
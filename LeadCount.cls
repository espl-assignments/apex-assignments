/*Write a SOQL query to find total number of Lead records by status by Lead Source. Store this 
information in map and display the same.*/

public class LeadCount{
	public static void getLeadCount(){
		String innerMapKey;
		String outerMapkey;
      	Integer value,values;
      	
      	map<String,Integer> innerMap = new  map<String,Integer>();
      	
      	map<String,map<String,Integer>> outerMap = new map<String,map<String,Integer>>();
      	
       	AggregateResult[] record =  [SELECT count(Id) total,Status,LeadSource from Lead group by Status,LeadSource];
       	
        for(AggregateResult result : record){
           	innerMapKey = (String)result.get('Status');
           	
            value = (Integer)result.get('total');
            
			innerMap.put(innerMapKey,value);
			
            outerMapkey = (String)result.get('LeadSource');
            
			outerMap.put(outerMapkey,innerMap);
        }   
        
       system.debug(outerMap);
    }
}
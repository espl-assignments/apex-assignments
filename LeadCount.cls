/*Write a SOQL query to find total number of Lead records by status by Lead Source. Store this 
information in map and display the same.*/

public class LeadCount{
	public static void getLeadCount(){
		String key,keys;
      	Integer value,values;
      	
      	map<String,Integer> innerMap = new  map<String,Integer>(); //Inner map
      	
      	map<String,map<String,Integer>> outerMap = new map<String,map<String,Integer>>(); //Outer Map
      	
       	AggregateResult[] record =  [SELECT count(Id) total,Status,LeadSource from Lead group by Status,LeadSource];
       	
        for(AggregateResult result : record){
            key=(String)result.get('Status');
            value=(Integer)result.get('total');
			innerMap.put(key,value); //Putting values in innner map.
            keys=(String)result.get('LeadSource');
			outerMap.put(keys,innerMap); //Putting values in the outer map.
        }   
       system.debug(outerMap); //Print the map
    }
}
/*Write a SOQL query to find total number of Lead records by status by Lead Source. Store this 
information in map and display the same.*/

public class LeadCount{
	public static void getLeadCount(){
		Map<String,Integer> myMap = new Map<String,Integer>();
		List<aggregateResult> results = [Select LeadSource,count(Status) total from Lead group by LeadSource];
		String key;
		Integer val;
		for (AggregateResult ar : results){
			key=(String)ar.get('LeadSource');
			val=(Integer)ar.get('total');
			if(!myMap.containsKey(key)){
					myMap.put(key,val);
			}
		}	
			for(String myMap1 : myMap.keySet()){
				System.debug(myMap1+' '+myMap.get(myMap1));
			}
			
  			//System.debug(ar.get('leadsource')+'-'+ar.get('total'));
	}
}
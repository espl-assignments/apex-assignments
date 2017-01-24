/*2. Find total number of distinct Lead records on basis of 'Lead Source' having greater than 10 leads. 
Print this information.*/
public class DistinctLead{
	public static void countDistinctLeads(){
		List<AggregateResult> results = [select LeadSource,COUNT_DISTINCT(Name) total from Lead group by LeadSource having COUNT_DISTINCT(Name) > 10];
		for (AggregateResult ar : results)  
  			System.debug(ar.get('leadsource')+'-'+ar.get('total'));
	}
}
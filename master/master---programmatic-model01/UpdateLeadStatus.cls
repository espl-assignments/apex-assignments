/*Find all the Lead records having Status as Won & update the stage with New value*/

public class UpdateLeadStatus{
	public static void setStatus(){
		String newStatus = 'Closed - Converted';
		List<Lead> leadList = new List<Lead>();
		List<Lead> updateLead = [SELECT Id, Name,Status FROM Lead where Status='Open - Not Contacted'];
		for (Lead leadList1: updateLead){
        	leadList1.Status=newStatus;
        	update LeadList1;
    	}	
	}
}
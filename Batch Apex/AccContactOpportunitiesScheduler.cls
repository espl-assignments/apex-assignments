/*
Scheduler class for AccContactOpportunities
*/


global with sharing class AccContactOpportunitiesScheduler implements Schedulable{
	
	global static String sched = '0 00 00 * * ?';  //Every Day at Midnight
	
	global static String scheduleMe() {
		AccContactOpportunitiesScheduler SC = new AccContactOpportunitiesScheduler();
		return System.schedule('Your batch Job', sched, SC);
    }
	
	global void execute(SchedulableContext dc){
		AccContactOpportunities aobatch = new AccContactOpportunities ();
		Database.executeBatch(aobatch); //execute the batch
	}
}
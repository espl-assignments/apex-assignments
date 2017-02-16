public with sharing class DupLeadRemovalScheduler implements Schedulable {
    public static String sched = '0 00 0/3 * * ?';  //Every Day every 3 hours
	
	 public static String scheduleMe() {
		DupLeadRemovalScheduler ds = new DupLeadRemovalScheduler ();
		return System.schedule('Your batch Job', sched, ds);
    }
	
	public void execute(SchedulableContext dc){
		DupLeadRemoval dupLeadBatch = new DupLeadRemoval ();
		Database.executeBatch(dupLeadBatch);
	}
}
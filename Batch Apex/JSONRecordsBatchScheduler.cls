global with sharing class JSONRecordsBatchScheduler implements Schedulable {
    global static String sched = '0 01 00 * * ?';  //Every Day per min
	
	global static String scheduleMe() {
		JSONRecordsBatchScheduler jSC = new JSONRecordsBatchScheduler();
		return System.schedule('Your batch Job', sched, jSC);
    }
	
	global void execute(SchedulableContext dc){
		JSONRecordsBatch jsonbatch = new JSONRecordsBatch ();
		Database.executeBatch(jsonbatch); //execute the batch
	}
}
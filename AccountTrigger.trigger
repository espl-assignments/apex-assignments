trigger AccountTrigger on Account (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    AccountTriggerClass accObject = new AccountTriggerClass();
    if(Trigger.isInsert){
    	if(Trigger.isBefore){
    		accObject.triggerContextVar();
	    } else if(Trigger.isAfter){
	 		accObject.triggerContextVar();   	
	    }
    }
    
    if(Trigger.isDelete){
    	if(Trigger.isBefore){
    		accObject.triggerContextVar();
	    } else if(Trigger.isAfter){
	 		accObject.triggerContextVar();   	
	    }
    }
    
    if(Trigger.isUpdate){
    	if(Trigger.isBefore){
    		accObject.triggerContextVar();
	    } else if(Trigger.isAfter){
	 		accObject.triggerContextVar();   	
	    }
    }
}
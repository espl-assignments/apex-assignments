trigger EFT_Trigger on EFT_Transaction_Status__c (after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        // Now call your helper method
        EFT_Trigger_Helper.createCaseWhenNeeded(Trigger.new);
    }
}
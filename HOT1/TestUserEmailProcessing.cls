/*
Test class for UserEmailProcessing.
 */
@isTest
private class TestUserEmailProcessing {

    public static testMethod void UserEmailProcessingTestSuccess() {
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
        email.subject = 'testSubject';
        email.fromName = 'test test';
        email.plainTextBody = 'Hello';
        envelope.fromAddress = 'test@test.com';
        
        UserEmailProcessing catcher = new UserEmailProcessing();
        Messaging.InboundEmailResult result = catcher.handleInboundEmail(email,envelope);
        System.assertEquals(result.success,true); 
    }
    
    // Error Case 1
     public static testMethod void UserEmailProcessingTestError(){
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        Messaging.InboundEnvelope envelope = new Messaging.InboundEnvelope();
        email.subject = 'testSubject';
        email.fromName = 'test';
        email.plainTextBody = 'Hello';
        envelope.fromAddress = 'test@test.com';
        
        UserEmailProcessing catcher = new UserEmailProcessing();
        Messaging.InboundEmailResult result = catcher.handleInboundEmail(email,envelope);
        System.assertEquals(result.success,false);    
     }
}
trigger MyFirstApexTrigger on Employee__c (before insert) {
    System.debug('Hello World!!');
}
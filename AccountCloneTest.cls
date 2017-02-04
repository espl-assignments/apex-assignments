/*
Testclass for AccountCloneTrigger.
*/

@isTest
private class AccountCloneTest {
	//Test for single record.
	static testMethod void testSingleAccountClone() {   
		Test.startTest();
        Account accountRow = new Account(Name='Test',BillingCity='TestCity');
        insert accountRow;
        Test.stopTest();
        
		Account accountList = [select Name, BillingCity from Account where id !=: accountRow.id];
        system.assertEquals('Test',accountList.Name); //Name should be equal to Name in accountRow
        system.assertEquals('TestCity',accountList.BillingCity); //BillingCity should be equal to BillingCity in accountRow
	}
	
	//Test for bulkified data.
	static testMethod void testBulkAccountClone() {   
		Integer counter = 100; 
		Test.startTest();
        List<Account> accountsList = new list<Account>();
    	for (Integer i = 1; i <= counter; i++){
          	Account acc = new Account(Name='TestAcc '+i,BillingCity='TestAccCity '+i);
          	accountsList.add(acc);
    	}
    	insert accountsList;
    	Test.stopTest();
      	List<Account> accList = [SELECT Id FROM Account];  
		System.assertEquals(accountsList.size(),counter);
		System.assertEquals(accList.size(),200);       
    }
}
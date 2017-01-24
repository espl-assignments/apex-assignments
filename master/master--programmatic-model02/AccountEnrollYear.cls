/*
Create a multiselect picklist on Account object called as 'Enrollment Year' with values 
2010, 2011,2012, 2013, 2014, 2015 and 2016. Get all account records where in selected 'Enrollment Year' is: 
a. 2010 
b. 2013 and 2014 
*/

public class AccountEnrollYear{
	public static void getAccount(){
		List<Account> accountList = new List<Account>();
		
		System.debug('Accounts whose Enrollment Year is 2010: ');
		for(Account a: [Select Id, Name, Enrollment_Year__c from Account where Enrollment_Year__c = '2010']){
			accountList.add(a);
 			System.debug(accountList);
		}
		
		List<Account> accountList1 = new List<Account>();
		System.debug('Accounts whose Enrollment Year is 2013 or 2014: ');
		for(Account a1: [Select Id, Name, Enrollment_Year__c from Account where Enrollment_Year__c INCLUDES ('2013', '2014')]){
			accountList1.add(a1);
			System.debug(accountList1);
		}
	}
}
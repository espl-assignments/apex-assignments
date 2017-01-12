/*
3. Create a Account Record with Name =”Eternus”. Create associated contacts. 
Create a Custom field called Contact Count on Account . Query on Contact 
where Account.Name =”Eternus” and count the associated contacts. Update
the custom field on Accounts with that count.
*/

public class ContactAccountQ{
	public static void getRecords(){
		Integer counter = [Select count() from Contact,Contact.Account where Account.Name = 'Eternus'];
		Account acc=[Select Id,Contactcount__c from Account where Name='Eternus'];
		System.debug(counter);
		acc.Contactcount__c = counter;
		update acc;
	}
}
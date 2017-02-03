/**************************************************************************************************
 * Class : CheckDuplicateContactsHelper
 * Created By : Pranali Mahajan
 --------------------------------------------------------------------------------------------------
 * Description : CheckDuplicateContactsHelper class to help the CheckDuplicateContacts Trigger. 
 * Test Class : DupicateContacts
 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version  Developer Name   	 Date          	Detail Features
 * 1.0      Pranali Mahajan   			   		Initial Development
 **************************************************************************************************/
public with sharing class CheckDuplicateContactsHelper {
	public void validateContact(List <Contact> contactlist){
		List<Contact> contacts = new List<Contact>();
		for (Contact c : contactlist){
			contacts= [select id from Contact where (Phone=:c.Phone or Email =:c.Email)];
			if (contacts.size() > 0) {
				c.addError('Contact cannot be created: Contact already exists with the same email or phone combination');
			}
		} 
	}  
}
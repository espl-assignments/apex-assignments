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
		List<Contact> contacts = [Select Phone, Email from Contact];
		for (Contact c : contactlist){
			for(Contact c1: contacts){
				if(c1.Phone == c.Phone && c1.Email == c.Email){
					c.addError('Contact cannot be created: Contact already exists with the same email and phone combination');
				}
				if(c1.Phone == c.Phone){
					c.addError('Contact cannot be created: Contact already exists with the same phone');
				}
				if(c1.Email == c.Email){
					c.addError('Contact cannot be created: Contact already exists with the same email');
				}
			}
		} 
	}  
}
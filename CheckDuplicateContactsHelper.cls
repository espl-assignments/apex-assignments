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
		Map <String, Contact> eMailMap = new Map <String, Contact> ();
		Map <String, Contact> phoneMap = new Map <String, Contact> ();
		for(Contact con : contactlist){
			if((con.Email != null) && (eMailMap.containsKey(con.Email))){
				con.Email.addError('Contact exists with same email address');
			}
			
			else{
				eMailMap.put(con.Email,con);
			}
		}
		
		for(Contact con : contactlist){
			if((con.Phone != null) && (phoneMap.containsKey(con.Phone))){
				con.Phone.addError('Contact exists with same phone number');
			}
			
			else{
				phoneMap.put(con.Phone,con);
			}
		}
		
		for(Contact contactObj : [Select Email, Phone from Contact where Email In : eMailMap.keySet() AND Phone In : phoneMap.keySet()]){
			Contact emailConObj = eMailMap.get(contactObj.Email);
			Contact phoneConObj = phoneMap.get(contactObj.Phone);
			emailConObj.addError('Contact with same email address and phone number already exists!');
			phoneConObj.addError('Contact with same email address and phone number already exists!');
		}
	}  
}
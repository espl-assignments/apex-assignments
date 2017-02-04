/**************************************************************************************************
 * Class : DuplicateContacts
 * Created By : Pranali Mahajan
 --------------------------------------------------------------------------------------------------
 * Description : Test Class to test the functionality of CheckDuplicateContactsController
 * Test Class : DupicateContacts
 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version  Developer Name   	 Date          	Detail Features
 * 1.0      Pranali Mahajan   			   		Initial Development
 **************************************************************************************************/
 
@isTest
private class DuplicateContacts {
 	@isTest static void contactDuplicateCheck_PhoneDupSenario() {
		
		Contact con = new Contact(LastName = 'TestConts0', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
		Contact cont = new Contact(LastName = 'TestConts0', Phone = '555-1212' , Email = 'TestConts00@gmail.com');
		Test.startTest();
		insert con;
		try{
			insert cont;
		}
		catch(Exception e){
			System.assert(e.getMessage().contains('Duplicate Phone'));
		}
		List<Contact> con1 = [select id, LastName, Phone, Email from Contact where Phone = '555-1212'];
		Test.stopTest();
		System.assertEquals(1,con1.size());
    }
 	
 	@isTest static void contactDuplicateCheck_EmailDupSenario() {
		Contact con = new Contact(LastName = 'TestConts0', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
		Contact cont = new Contact(LastName = 'TestConts0', Phone = '555-0212' , Email = 'TestConts0@gmail.com');
		Test.startTest();
		insert con;
		try{
			insert cont;
		}
		catch(Exception e){
			System.assert(e.getMessage().contains('Duplicate Email'));
		}
		List<Contact> con1 = [select id, LastName, Phone, Email from Contact where Email = 'TestConts0@gmail.com'];
		Test.stopTest();
		System.assertEquals(1,con1.size());
    }
    
    @isTest static void contactDuplicateCheck_PhoneEmailDupSenario() {
		Contact con = new Contact(LastName = 'TestConts0', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
		Contact cont = new Contact(LastName = 'TestConts0', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
		Test.startTest();
		insert con;
		try{
			insert cont;
		}
		catch(Exception e){
			System.assert(e.getMessage().contains('Duplicate Email'));
		}
		List<Contact> con1 = [select id, LastName, Phone, Email from Contact where Phone = '555-1212'and Email = 'TestConts0@gmail.com'];
		Test.stopTest();
		System.assertEquals(1,con1.size());
    }
    
    
}
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
	 @testSetUp
	 	static void setup() {
	 	List<Contact> testConts = new List<Contact>();
		for(Integer i=0;i<2;i++) {
			testConts.add(new Contact(LastName = 'TestConts'+i , Phone = '555-1212' , Email = 'TestConts'+i+'@gmail.com'));
 		}
 	insert testConts;
	 }
	 
 	@isTest static void testMethod1() {
		List<Contact> con = [select id, LastName, Phone, Email from Contact];
		Contact cont = new Contact(LastName = 'TestConts0', Phone = '555-1212' , Email = 'TestConts0@gmail.com');
		Test.startTest();
			insert cont;
		Test.stopTest();
		System.assertEquals(con[0],cont);
    }
 	
 	@isTest static void testMethod2() {
		List<Contact> con = [select id, LastName, Phone, Email from Contact];
		Contact cont = new Contact(LastName = 'TestConts00', Phone = '555-0512' , Email = 'TestConts00@gmail.com');
		Test.startTest();
			insert cont;
		Test.stopTest();
		System.assertEquals(con[0],cont);
    }
}
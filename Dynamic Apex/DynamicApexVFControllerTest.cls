/*
	Test class for DynamicApexVFController
*/
@isTest
private class DynamicApexVFControllerTest {

	@isTest static void checkDefaults() {
		PageReference pageRef = Page.DynamicApexVF;
     	Test.setCurrentPageReference(pageRef);
    	DynamicApexVFController incontroller = new DynamicApexVFController();
    	incontroller.selectedObject='Account';
        incontroller.outputString='id';
        incontroller.selectedSort='Ascending';
        Test.startTest();
        String outputQuery=incontroller.query;
        Test.stopTest();
        System.assertEquals('SELECT id from Account order by CreatedDate asc limit 500',outputQuery);
	}

	@isTest static void checkResult() {
    	Account account = new Account(Name='test');
    	PageReference pageRef = Page.DynamicApexVF;
    	Test.setCurrentPageReference(pageRef);
    	DynamicApexVFController incontroller = new DynamicApexVFController();
    	incontroller.selectedObject='Account';
    	incontroller.outputString='id';
    	incontroller.selectedSort='Descending';
    	incontroller.selectedLimit='1000';
    	Test.startTest();
    	//incontroller.queryGenerater();
    	String outputQuery=incontroller.query;
    	Test.stopTest();
    	System.assertEquals(false,incontroller.renderQuery);
    }

	@isTest static void checkselectedLimit() {
    	PageReference pageRef = Page.DynamicApexVF;
    	Test.setCurrentPageReference(pageRef);
    	DynamicApexVFController incontroller = new DynamicApexVFController();
    	
    	incontroller.selectedObject='Account';
    	incontroller.outputString='id';
		incontroller.selectedSort='Descending';
		
		Test.startTest();
    	List<SelectOption> sorts = incontroller.getLimit();
    	Test.stopTest();
    	System.assertEquals(4,sorts.size());
    }

	@isTest static void checkselectedSort() {
    	PageReference pageRef = Page.DynamicApexVF;
    	Test.setCurrentPageReference(pageRef);
   		DynamicApexVFController incontroller = new DynamicApexVFController();
   		
    	incontroller.selectedObject='Account';
    	incontroller.outputString='id';
    	
    	Test.startTest();
    	List<SelectOption> sorts = incontroller.getSort();
    	Test.stopTest();
    	System.assertEquals(2,sorts.size());
    }

	@isTest static void checkObjectFields() {
    	PageReference pageRef = Page.DynamicApexVF;
    	Test.setCurrentPageReference(pageRef);
    	Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    	Schema.SObjectType ObjectSchema = schemaMap.get('Account');
    	Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
    	List<SelectOption> fieldNames = new List<SelectOption>();
    	for (String fieldName: fieldMap.keySet()) {
        	fieldNames.add(new SelectOption(fieldName,fieldName));
    	}
    	DynamicApexVFController incontroller = new DynamicApexVFController();
    	incontroller.selectedObject='Account';
    	Test.startTest();
    	List<SelectOption> field = incontroller.getObjectFields();
    	Test.stopTest();
    	System.assertEquals(fieldNames,field);
    }

	@isTest static void checkAllObjects() {
    	PageReference pageRef = Page.DynamicApexVF;
    	Test.setCurrentPageReference(pageRef);
    	Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    	List<SelectOption> objNames = new List<SelectOption>();
    	List<String> entities = new List<String>();
    	Schema.DescribeSObjectResult objInfo=null;
    	for(Schema.SObjectType obj :schemaMap.values())
        {
			objInfo=obj.getDescribe();
            if(objInfo.isQueryable()) {
                entities.add(objInfo.getName());
            }
        }
    	for(String name : entities)
        {
           objNames.add(new SelectOption(name,name));
        }
    	DynamicApexVFController incontroller = new DynamicApexVFController();
    	Test.startTest();
    	List<SelectOption> objects = incontroller.getObjectNames();
    	Test.stopTest();
    	System.assertEquals(objNames,objects);
    }
	
	@isTest static void checkSelectClick() {
    	PageReference pageRef = Page.DynamicApexVF;
    	Test.setCurrentPageReference(pageRef);
    	DynamicApexVFController incontroller = new DynamicApexVFController();
    	incontroller.selectedObject='Account';
    	incontroller.selectedField='id';
    	Set<String> rightFields= new Set<String>();
    	rightFields.add(incontroller.selectedField);
    	Test.startTest();
    	incontroller.selectClicked();
    	Test.stopTest();
    	system.assertEquals(rightFields,incontroller.rightvalues);
    }
    
    @isTest static void checkError() {
        PageReference pageRef = Page.DynamicApexVF;
     	Test.setCurrentPageReference(pageRef);
   		DynamicApexVFController incontroller = new DynamicApexVFController();
    	incontroller.selectedObject='Account';
        System.assertEquals(incontroller.addError,null);
	}    
}
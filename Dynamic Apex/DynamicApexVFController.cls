/*
Query Builder : Generate Dynamic SOQL Statement.
*/
public with sharing class DynamicApexVFController {
	public Map <String,Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
	Map<String, Schema.SObjectField> fieldMap;
    public String selectedObject {get; set;}
    public String selectedField {get; set;}
    public Set<string> rightvalues {get;set;}
    public List<string> rightselected{get;set;}
    List<SelectOption> selectedoptions {get; set;}
    List<SelectOption> fieldNames;
    public String selectedLimit {get; set;}
    public String selectedSort {get; set;}
    public String query {get; set;}
    public String orderByClause;
    public String limitClause;
    public String outputString {get;set;}
    public List<SObject> result{get;set;}
    public Boolean renderQuery{get;set;}
    public List<string> tempList {get;set;}
    public Boolean addError {get; set;}
    Set<String> fieldList = new Set<String>();
	
	public DynamicApexVFController() {
		rightselected = new List<String>();
        rightvalues = new Set<String>();
        outputString = '';
        renderQuery=false;
        selectedSort='Ascending';
        selectedLimit='500';
        selectedObject='Select Object';
        selectedField='Select Fields';
        fieldNames= new List<SelectOption>();
    }

    public List<SelectOption> getObjectNames() {
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>();
        Schema.DescribeSObjectResult objInfo=null;
		for(Schema.SObjectType obj :schemaMap.values())
        {
			objInfo=obj.getDescribe();
			if(objInfo.isQueryable()) {
				objNames.add(new SelectOption(objInfo.getLocalName(),objInfo.getLabel()));
            }
        }
        return objNames;
    }

    public List<SelectOption> getObjectFields() {
            if(selectedObject!='Select Object')
            {
				Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
                Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
                fieldMap = ObjectSchema.getDescribe().fields.getMap();
                Schema.DescribeFieldResult objInfo=null;
                fieldNames= new List<SelectOption>();
                for(Schema.SObjectField obj :fieldMap.values()) {
                    objInfo=obj.getDescribe();
                    if(objInfo.isAccessible()) {
                        fieldNames.add(new SelectOption(objInfo.getLocalName(),objInfo.getLabel()));
                    }
                }
            }
            else {
				fieldNames.clear();
            }
			return fieldNames;
	}

	public PageReference selectClicked() {
		selectedField = selectedField.remove('[');
        selectedField = selectedField.remove(']');
        rightvalues.add(selectedField);
        System.debug('abccc '+selectedField);
        return null;
	}

    public PageReference unselectClicked() {
       //leftselected.clear();
      for(String s : rightselected){
           rightvalues.remove(s);
           //leftvalues.add(s);
       }
       return null;
    }

    public List<SelectOption> getSelectedValues() {
        List<SelectOption> selectedoptions = new List<SelectOption>();
        tempList = new List<String>();
        tempList.addAll(rightvalues);
        for(String s : tempList)
        selectedoptions.add(new SelectOption(s,s));
        outputString = String.join(tempList ,',');
        outputString =outputString.replace('{',' ');
        outputString =outputString.replace('}',' ');
        System.debug('debug it ' +outputString );
        return selectedoptions;
    }

	public List<SelectOption> getLimit() {
		List<SelectOption> recordlimit = new List<SelectOption>();
        recordlimit.add(new SelectOption('500', '500'));
        recordlimit.add(new SelectOption('1000', '1000'));
        recordlimit.add(new SelectOption('5000', '5000'));
        recordlimit.add(new SelectOption('50000', '50000'));
        return recordlimit;
   }

	public List<SelectOption> getSort() {
        List<SelectOption> sortOptions = new List<SelectOption>();
        sortOptions.add(new SelectOption('asc', 'Ascending'));
        sortOptions.add(new SelectOption('desc', 'Descending'));
        return sortOptions;
    }
    
    public void queryGenerater() {
        limitClause ='limit'+' '+selectedLimit;
        orderByClause = 'order by CreatedDate'+' '+selectedSort;
        query = 'SELECT '+ outputString + ' from ' + selectedObject + ' ' + orderByClause +' '+ limitClause;
        result= Database.query(query);
        renderQuery=true;
        addError=false;
   }

	public void executeQuery() {
        errorCheck();
    }

    public void errorCheck() {
        if(outputString == '')
        {
            addError=true;
        }
        else {
            queryGenerater();
        }
    }


}
public with sharing class StudentFormController { 
	 public boolean flag{get;set;}
	// the contact record you are adding values to
  	public Student__c stud {
    	get {
      	if (stud == null)
        	stud = new Student__c();
      		return stud;
    	}
    	set;
  	}
	
	public String lang {get; set;}

    public String selectlang { set; }
    
    public List<selectoption> getselectlang(){    
     	List<selectoption> opt = new List<selectoption>();
     	opt.add(new selectoption('None','Language'));
     	opt.add(new selectoption('English','English'));
     	opt.add(new selectoption('French','French'));
     	opt.add(new selectoption('Spanish', 'Spanish'));
     	return opt;
    }
    
    public String langlist { get; set; }

  	public StudentFormController() {
    	// blank constructor
  	}

  	// save button is clicked
	public PageReference submit() {
		try {
      		insert stud; // inserts the new record into the database
      		flag=true;
    	} catch (DMLException e) {
      		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error creating new student form.'));
      		return null;
    	}
    	return null;
  	}
  	
  	
  	public PageReference change() {
    	if(langlist == 'English')
     	{
    		lang='en_US';
     	} else if (langlist=='French')
       	{
			lang='fr';
		} else if(langlist=='Spanish')
       	{
			lang='es';
        }
        return null;
    }
}
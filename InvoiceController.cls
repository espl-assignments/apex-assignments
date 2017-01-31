public class InvoiceController{

    public AggregateResult[] groupedResults;
    public Double amount{get;set;}
    private Line_Item__c MyCustomObject;
    public String Ids;

    public InvoiceController(ApexPages.StandardController controller) {
      Ids=controller.getId();
      getBillRecord();
    }

    public PageReference getBillRecord() {
      AggregateResult[] groupedResults = [SELECT SUM(Amount__c)total FROM Line_Item__c
                                            where Invoice_Statement__c=: Ids];
      amount = (Double)groupedResults[0].get('total');
      return null;
    }
}
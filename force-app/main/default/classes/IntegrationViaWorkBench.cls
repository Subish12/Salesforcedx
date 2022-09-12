@RestResource(urlMapping='/v1/Salesforce/')

global class IntegrationViaWorkBench{
    
    @httpGet
    global static List<Book__c> toGetRecords(){
        List<Book__c> records = new List<Book__c>();
        records =[Select id,Name,Author_Name__c from Book__c];
        return records;
    }
    
    @httpPost
    global static Book__c toInsertRecords(String name){
        Book__c newData = new Book__c();
        newData.Name =name;
        
        insert newData;
        return newData;
    }
    
    @httpPut
    global static Book__c toUpdateRecords(String name){
        Map<String,String> regParams = RestContext.request.Params;
        String registerId = regParams.get('id');
        Book__c updateData = new Book__c();
        updateData.Name=name;
        updateData.Id=registerId;
        update updateData;
        return updateData;    
    }
}
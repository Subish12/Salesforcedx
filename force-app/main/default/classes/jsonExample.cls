public with sharing class jsonExample {
    @AuraEnabled
    public static void listExample(){
        try {
            List<String> numberList = new List<String>{'sri','rcb'};
            string jsonList = JSON.serialize(numberList);
            string jsonList1 = JSON.serializePretty(numberList);
            List<string> jsonList2 =(List<string>)JSON.deserialize(jsonList, List<string>.class);
            
            System.debug('JSON_SERIALIZE' +jsonList);
            System.debug('JSON_SERIALIZE_PRETTY'+jsonList1);
            System.debug('JSON_DESERIALIZE'+jsonList2);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}
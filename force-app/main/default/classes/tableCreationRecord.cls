public with sharing class tableCreationRecord {
    @AuraEnabled
    public static void getRecords(String accCon){
        try {
           system.debug(accCon);
           //system.debug(accCon);
           //String jsonAcc = JSON.serialize(accCon);
           //System.debug('Serialize value:' +jsonAcc);
           List<Contact> jsonAcc = (list<Contact>) JSON.deserialize(accCon, List<Contact>.class);
           system.debug('Deserialize value:' +jsonAcc);
           insert jsonAcc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}
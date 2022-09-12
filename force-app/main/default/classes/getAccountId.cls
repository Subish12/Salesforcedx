public with sharing class getAccountId {
    @AuraEnabled(cacheable=true)
    public static list<Contact> getAccId(Id accountId){
        try {
            system.debug(accountId);  

            List<Contact> Conlist = [Select id, name,firstname,lastname from Contact where AccountId=: accountId ];
            //insert Conlist;
            system.debug(Conlist.size());  
            return Conlist;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}
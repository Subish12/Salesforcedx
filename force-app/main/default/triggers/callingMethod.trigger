trigger callingMethod on Account (after insert,after update) {
    for(Account ac:Trigger.New){
        
    AccountIdEmail.idEmail(ac.id,ac.Email__c);
    }
}
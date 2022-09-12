trigger ContactTrigger on Contact (before insert,after insert,before update,after update,after delete) 
{
    Set<Id> AccIds = new Set<Id>();
    List<Account> setList = new List<Account>();
    List<Account> setList2 = new List<Account>();
    
    if(Trigger.isInsert && Trigger.isAfter){
        For(Contact con:Trigger.new){
            AccIds.add(con.AccountId);
            System.debug('Contact Account Ids:' +AccIds);
        }
    }
    
    if(Trigger.isUpdate || Trigger.isDelete){
        For(Contact cons:Trigger.old){
            AccIds.add(cons.AccountId);
            System.debug('Contact Account Ids:' +AccIds);  
        }
    }
    
    For(Account acc:[Select id,Child_Record_Count__c,(Select id,Accountid FROM Contacts) FROM Account WHERE Id IN:AccIds]){
        Account act = new Account();
        act.Id=acc.Id;
        act.Child_Record_Count__c=acc.Contacts.size();
        setList.add(act);
        System.debug('Number Of Contacts:' +setList); 
    }
    Update setList;
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        For(Contact con:[Select id,Total_Worth__c,Account.Id,Account.Sum_of_Totalamount__c FROM Contact WHERE Id IN:AccIds]){
        
        }
    }
    //Update setList2;
}
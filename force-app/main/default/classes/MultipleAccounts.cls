public class MultipleAccounts {
    public static void CreateAcc(Integer it,String str){
        List<Account> act = new List<Account>();
        List<Contact> con = new List<Contact>();
        Map<Id,List<Contact>> mpp = new Map<Id,List<Contact>>();
            
        for(Integer i=1;i<it;i++){
            Account acc = new Account();
            acc.Name=str+i;
            act.add(acc);
        
           						
                
            Contact cont = new Contact();
             //cont.AccountId = acc.Id;
            cont.LastName=acc.Name;
            con.add(cont);
            
            if(mpp.containsKey(acc.Id)){
               //zcon=mpp.get(acc.Id);
               mpp.put(acc.Id,con);
            }
                           
            System.debug(mpp);

        }
        
        System.debug(act);
        System.debug(con);
        
        Map<String,Id> mp =new Map<String,Id>();
        
        for(Account ac:act){
            mp.put(ac.Name,ac.Id);           
        }
        system.debug(mp);
    }
    
}
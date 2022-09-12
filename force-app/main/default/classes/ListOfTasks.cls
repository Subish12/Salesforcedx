public class ListOfTasks {
    public static void Task(String str){
        List<Contact> con = [Select Id,Name,AccountId FROM Contact WHERE AccountId=:str];
        System.debug('List Of Contacts' +con);
    }
    
    public static List<Contact> Task1(String str){
        List<Account> act = new List<Account>();
        List<Contact> con =new List<Contact>();
        
        Account ac =new Account();
        ac.Name=str;
        ac.BillingCity='Chennai';
        act.add(ac);
        
        System.debug('Account Details :' +ac);
        insert ac;
        System.debug('Account Details :' +ac);
        
        Contact cn = new Contact();
        cn.AccountId=ac.Id;
        cn.LastName='new' + ac.Name;
        con.add(cn); 
        insert cn;
        System.debug('Contact Details :' +con);
        
        return con;
    }
    
    public static void Task2(Integer it,String str){
        List<Account> act =New List<Account>();
        List<Contact> con = new List <Contact>();
        
       // Map<id, List<Contact>> NewMap = new Map<id, List<Contact>>();
        
        for(Integer i=1;i<=it;i++){
            Account ac =new Account();
            ac.Name=str;
            ac.AccountNumber='29283vsus';
            ac.Type='Agriculture';
            act.add(ac);
          
            
            for(Account a: act){
            Contact cn= new Contact();
            cn.AccountId=ac.Id;
            cn.LastName='New' + ac.Name;
            con.add(cn);
              
           // NewMap.put(ac.Id, con);
            }
        }
        System.debug('Accounts :' +act);
        System.debug('Contacts :' +con);
        insert act;
        insert con;
        
    }
    
    public static void Task3(){
        
        Map<String,String> mpstr = new Map<String,String>();
        mpstr.put('Apple', 'Red');
        mpstr.put('Apple', 'Blue');
        mpstr.put('Banana', 'Yellow');
        mpstr.put('Watermelon','Pink');
        System.debug(mpstr.KeySet());
        System.debug(mpstr.Values());
        System.debug(mpstr.containsKey('Apple'));
        System.debug(mpstr.get('Apple'));
        mpstr.put('Grapes','Violet');
        System.debug(mpstr);     
    }
    
    public static List<Account> Task4(List<String> ids){
        List<Account> acc = [Select id,Name,Active__c FROM Account WHERE Id IN :ids ];
        for(Account act:acc){
            System.debug(act.Active__c);
            if(act.Active__c=='Yes'){
                act.Active__c='No';
                
            }
            
            else{
                act.Active__c='Yes';
            }
            
            system.debug(':' +acc);   
        }
        update acc;
        return acc;
    }
    
    /*public static void Task5(String ids,String str){
        List <Contact> con = [Select Id,Email,AccountId,Account.Id,Account.EMail__c FROM Contact WHERE AccountId=:ids];
        List<Account> acc = new List<Account>();
        List<Contact> lstcon = new List<Contact>();
        
        For(Account act : acc){
            act.Ids=ids;
            act.Email=str;
            
            
        For(Contact cnt : con){
            cnt.Account.EMail__c=str;
            cnt.Email = str;
            
            lstcon.add(cnt);   
        }
        }
        System.debug(lstcon);
        update lstcon;  
    }*/
    
    public static void Task6(){
        List<Account> acc=[Select id,(Select id,LastName From Contacts) FROM Account];
        
        For(Account act:acc){
            if(act.Contacts.size()>0){
                System.debug(act);
                act.addError('Account cannot be deleted');
            }
        } 
    }
}
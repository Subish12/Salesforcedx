public class NewTasks {
    
    public static void Task3(List<String> AccId){
        List<String> AccountId = new List<String>();
        Messaging.SingleEmailMessage mails = new Messaging.SingleEmailMessage();
        List<Account> IdCheck = [Select id,name,Owner.Email from Account WHERE Id IN:AccId];
        for(Account acc:IdCheck){
            Accountid.add(acc.Owner.Email);
        }
        
        mails.setToAddresses(AccountId);
        mails.setSubject('Account Creation');
        mails.setPlainTextBody('New Account is created');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mails });
        
    }
    public static void Task4(){
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE IsDefault=true];
        System.debug(bh);
        Date dts = System.today();
        System.debug(dts);
        DateTime dt=Datetime.now();
        System.debug(dt);
        
        if(BusinessHours.isWithin(bh.Id,dt)){
            System.debug('Business hours');
        }
        else{
            System.debug('Not a Business hours');
        }   
    }
    public static void Task5(String Ids){
        List<Account> AccList=[Select id,Date_of_Birth__c,Upcoming_Birthday__c FROM Account WHERE Id =:Ids];
        for(Account ac:AccList){
            if(System.today() < ac.Date_of_Birth__c){
                Datetime dt = Datetime.newInstance(System.today().year(), ac.Date_of_Birth__c.month(), ac.Date_of_Birth__c.day());
                System.debug(dt);          
            }
            
            else
                
            {
                Datetime dt = Datetime.newInstanceGmt(System.today().year() +1,ac.Date_of_Birth__c.month(), ac.Date_of_Birth__c.day());
                System.debug(dt);
            }
            
        }
        
    }
    
    
    public static void Task6(){
        try{
            List<Account> AccList = new List<Account>();
            For(Account acc:[Select id,AnnualRevenue,BillingCountry,Type FROM Account Where AnnualRevenue>100000]){
                if(acc.AnnualRevenue>100000 && acc.BillingCountry=='US' && acc.Type=='Manufacturing Partner'){
                    acc.Weather__c='Hot';
                    AccList.add(acc); 
                }
                Update AccList;
                System.debug(acc);
            }  
        }
        catch(Exception e){
            System.debug('An error has occured:' +e.getMessage()); 
        }
        
    }
    public static void Task8(Integer i,String AccName){
        List<Account> AccList = new List<Account>();
        List<Contact> ConList = new List<Contact>();
        Map<id,List<Contact>> iMap = new Map<id,List<Contact>>();
        
        For(Integer j=1;j<i;j++){
            Account acc = new Account();
            acc.Name=AccName;
            acc.EMail__c='Task@gmail.com';
            AccList.add(acc);
        }
        insert AccList;
        
        For(Account acct :AccList){
            Contact con = new Contact();
            con.AccountId=acct.Id;
            con.LastName=acct.Name;
            con.Email=acct.EMail__c;
            ConList.add(con);
        }
        
        insert ConList;
        System.debug('List Of Accounts' +AccList);
        System.debug('List Of Contacts' +ConList);
        
    }
    
    
    
    
    public static void Task4_1(){
        DateTime todayDateandtime = DateTime.now();
        System.debug(todayDateandtime);
        Boolean Check = True;
        
        String str= todayDateandtime.format('EEEE');
        System.debug(str);
        
        
        if(str=='Saturday' || str=='Sunday'){
            Check =False;
            System.debug(Check);
        }
        
    }
    
    public static void accountContactCreation(Integer i,Integer j,String str){
        
        Map<String,List<Contact>> ConMap =new Map<String,List<Contact>>();
        
        List<Account> AccList = new List<Account>();
        For(Integer a=1;a<i;a++){
            Account acc =new Account();
            acc.Name=str+a;
            AccList.add(acc);
            
            List<Contact> ConList = new List<Contact>();
            For(Integer b=1;b<j;b++){
                Contact con = new Contact();
                con.AccountId=acc.Id;
                con.LastName=str+b;
                ConList.add(con);    
            } 
            ConMap.put(acc.Name,ConList);
        }
        insert AccList;
        
        List<Contact> newConList = new List<Contact>();
        
        For(Account acc:AccList){
            For(Contact c:ConMap.get(acc.Name)){
                c.AccountId=acc.Id;
                newConList.add(c); 
            }    
        }
        insert newConList;
        
    }    
    
}
public class SampleClass {
    public static void NewMethod(integer i, String s){
        List<Account> AccList = new List<Account>();
        List<Contact> ConList = new List<Contact>();
        Map<string,List<Contact>> mp = new Map<string,List<Contact>>();
        
        For(Integer l=1; l<=i; l++){
            Account ac =new Account(Name=s+l);
            AccList.add(ac);
            //mp.put(ac.Id,ac.Contacts);
            
            For(Account a :AccList){
                Contact con = new Contact(AccountId=a.Id,LastName=s+i+i);
                ConList.add(con);
                mp.put(a.Id,a.Contacts);
            }                          
        }
        insert AccList;
        System.debug(mp);
        
    }
    public static void NewMethod1(integer l, String s){
        List<Account> AccList = new List<Account>();
        List<Contact> ConList = new List<Contact>();
        
        For(Integer i=1; i<=i; i++){
            Account ac =new Account(Name=s+l);
            AccList.add(ac);
            
            For(Account a :AccList){
                Contact con = new Contact(AccountId=a.Id,LastName=s+i+i);
                ConList.add(con);                
            }                   
        }
    }
}
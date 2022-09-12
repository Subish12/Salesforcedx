public class AccountInsert {
    public static void insertAccount() {
        List<Account> acc=new List<Account>();
        Account ac=new Account();
        ac.Name='Subish';
        ac.AccountNumber='12345';
        ac.ShippingCity='Chennai';
        
        Account ac1=new Account();
        ac1.Name='Yogesh';
        ac1.AccountNumber='123457';
        ac1.ShippingCity='Mumbai';
        
        System.debug('New Account:' +ac);
        System.debug('New Account:' +ac1);
        
        acc.add(ac);
        acc.add(ac1);
       
        insert ac;
        insert ac1;
    }
}
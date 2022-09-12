public class AccountInsertion {
    public static Account insertNewAccount(String myVal) {
        if(myVal=='Salesforce'){
            Account act=new Account(Name=myval,Phone='12345');
            system.debug('New Account:' +act);
           
                insert act;
            	return act; 
           }
        else{
            system.debug('Error');
            return null;
        }
    }
}
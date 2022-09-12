public class MapRelation {
    public static void AccIdContact(){
        Map<id,List<Contact>> accountMap = new Map<id,List<Contact>> ();
        List<Account> accountList =[ select id,name from Account];
        for(contact con:[select id,accountId from contact where accountId IN:accountList]) {
            if(accountMap.containsKey(con.accountId)) {
                accountMap.get(con.accountId).add(con);
            } else {
                accountMap.put(con.accountId,new List<contact>{con});
            }
        }
        system.debug('accountMapaccountMap'+accountMap);  
    }
}
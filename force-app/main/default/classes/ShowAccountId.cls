public class ShowAccountId {
    public static Id AccConId(List <String> ids,String conid){
        List<Account> acc =[Select id,Name,(Select id,AccountId FROM Contacts) FROM Account];
        
        for(Account ac:acc){
            for(Contact con:ac.Contacts){
                if(con.Id==conid){
                    system.debug(ac.Id);
                    return ac.id;
                }
            }   
        }  
        return null;
        
    }
    
}
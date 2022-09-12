public class MapExample {
    public static void insertGet(){
        Map<Integer,String> mp= new Map<Integer,String>();
        mp.put(1,'Subish');
        mp.put(2,'Daniel');
        system.debug('Map Values:' +mp);
        system.debug('Second Values:'+mp.get(2));
        
        Boolean check=mp.isEmpty();
        system.debug(check);
            
        Map<Id, Account> acc = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 5]);
        system.debug(acc);
        //system.debug(acc.size());
            
    }
}
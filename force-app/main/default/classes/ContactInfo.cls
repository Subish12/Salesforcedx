public class ContactInfo {
    public void getNoOfContacts(){
        List<sObject>Con=Database.query('SELECT Count(Name), Account.Name FROM Contact GROUP BY Account.Name');
        system.debug('End Result:' + con);
    }
}
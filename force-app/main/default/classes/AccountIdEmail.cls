public class AccountIdEmail {
    public static list<Contact> idEmail(String num,String email){
        
        List<Contact> lst=[Select Accountid,id,Email FROM Contact WHERE Accountid=:num];
        System.debug(lst);
        List<Contact> lstcon=new List<Contact>();
        for(Contact con:lst){
            
            con.Email=email;
            lstcon.add(con);             
        }      
        system.debug(lstcon);
        update lstcon;
        return lstcon;
    }
}
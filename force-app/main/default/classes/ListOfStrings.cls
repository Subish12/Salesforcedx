public class ListOfStrings {
    public static List<String> Strings(){
        String str='Salesforce_Apex_LWC_Visualforce';
        
        List<string> Lststring=str.split('_');
        
        system.debug('List Of strings:' +Lststring);
     	system.debug('SECOND VALUE OF THE STRING:' +Lststring[1]);
        
        for(String strs:Lststring)
        {
            system.debug('String_' +strs);
        }
     return Lststring;
    }
    
    /*public void Loops{
        for(Integer i=1;i<=Str.sixeOf();i++)
        {
            system.debug(str);
        }
    }*/
    
    

}
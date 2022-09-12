public class List_Set {
    public static  void listSet(){
        list<string> lststring=new list<string>{'a','a','b','c','d','d','e'};
        set<string>ststring=new set<string>(lststring);
        system.debug('List Values:' +lststring);
        system.debug('Set Values:' +ststring);
    }
    public static  void setList(){
        set<string>ststring=new set<string>{'a','a','b','c','d','d','e'};
        list<string> lststring=new list<string>(ststring);
         system.debug('set values:' +ststring);
        system.debug('List values:' +lststring);
    }

}
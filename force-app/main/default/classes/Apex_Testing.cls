public class Apex_Testing
{
    public void ListExample()
    {
        List<String> ListOfStates=new List<String>{'TamilNadu','Andhrapradesh'};
        System.debug('StateName:'+ListOfStates);
        ListOfStates.add('Delhi');
        System.debug('StateName:'+ListOfStates);
    }
    public void SetExample()
    {
        Set<String> ListOfCapitals=new Set<String>{'Chennai','Hyderabad'};
        System.debug('CapitalName:'+ListOfCapitals);
        ListOfCapitals.remove('Hyderabad');
        System.debug('CapitalName:'+ListOfCapitals);
    }
	//public void MapExample
    {
        Map<string,string> Shortform_Stateno=new Map<string,string>{'TN'=>'25','AP'=>'02'};
        System.debug('StateProperties' +Shortform_Stateno);
    }
}
public class ListCustomSetting {
    Public static void displayValues(){
        
        List<Employee_Details__c> lst =Employee_Details__c.getall().values();
        system.debug('All Record' +lst);
        
        Employee_Details__c emp =Employee_Details__c.getinstance('Detail 3');
        system.debug('Detail 3 Record' +emp);
        
    }
}
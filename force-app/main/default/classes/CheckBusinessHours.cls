public class CheckBusinessHours {
    public static void CheckBusinessHours(){
        BusinessHours bh = [SELECT Id FROM BusinessHours WHERE IsDefault=true];
        
        DateTime dt=Datetime.now();
        Boolean check1=BusinessHours.isWithin(bh.Id,dt);
        system.debug('Business_Hours:' +check1);
        
        Datetime targetTime = Datetime.newInstance(2022, 4, 03, 1, 6, 8);
        Boolean check= BusinessHours.isWithin(bh.Id,targetTime);
        system.debug('Business_Hours:' +check);
    }
}
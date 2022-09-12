public class PlatformEventCtrl {
public static void publishEvent(){
        Demo_ptfevt__e event = new Demo_ptfevt__e();
        event.Message__c = 'test';
        event.Record_Id__c = '0016F000041zsTDQAY';
        event.Status__c = 'Success';
        EventBus.publish(event);
    System.debug('Eventt: ' +event);
    }
}
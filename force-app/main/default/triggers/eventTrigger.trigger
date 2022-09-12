trigger eventTrigger on Account (after update) {
    Mesaage_Event__e event = new Mesaage_Event__e();
    event.Message__c ='Account has been Updated';
    EventBus.publish(event);
    System.debug('Event Processed' +event);
}
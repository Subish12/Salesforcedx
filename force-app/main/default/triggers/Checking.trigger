trigger Checking on Contact (Before Update) {
            system.debug('Trigger.old======>'+Trigger.old);
            system.debug('Trigger.isBefore======>'+Trigger.isBefore);
            system.debug('Trigger.isAfter======>'+Trigger.isAfter);
            system.debug('Trigger.isUpdate======>'+Trigger.isUpdate);
            system.debug('Trigger.isnew======>'+Trigger.new);
            system.debug('Trigger.isold======>'+Trigger.old);
            system.debug('Trigger.isnewMap======>'+Trigger.newMap);
            system.debug('Trigger.isoldMap======>'+Trigger.OldMap);
    
            system.debug('Trigger.isExecuting======>'+Trigger.isExecuting);
            system.debug('Trigger.Size======>'+Trigger.Size);
            /*system.debug('Trigger.isInsert======>'+Trigger.isInsert);
            system.debug('Trigger.isInsert======>'+Trigger.isInsert);
            system.debug('Trigger.isInsert======>'+Trigger.isInsert);*/

}
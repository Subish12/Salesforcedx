trigger eventsAction on Mesaage_Event__e (after insert) {
System.debug('rUNNNN');
    for(Mesaage_Event__e event : Trigger.new){
        System.debug('Mailllll123');
      List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      List<String> sendTo = new List<String>();
      sendTo.add('subish@sedintechnologies.com');
      mail.setToAddresses(sendTo);
      mail.setSubject('Test Mail');
      String body = event.Message__c; 
      mail.setHtmlBody(body);
      mails.add(mail);
        System.debug('Mailllll');
  	  Messaging.sendEmail(mails);
	}
}
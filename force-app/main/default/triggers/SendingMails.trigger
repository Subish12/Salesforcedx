trigger SendingMails on Account (after insert,after update) {
    
    for(Account ac:Trigger.New){
        if(ac.Industry=='Banking'){
           Contact[] con=[Select id,Email FROM Contact WHERE AccountId=:ac.Id];
           EmailManager.sendMail(con[0].Email,'Email Checking Regards','Your Industry is set as Banking');
        }
    }
}
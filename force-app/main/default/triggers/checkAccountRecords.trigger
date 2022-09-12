trigger checkAccountRecords on Account (before insert,before update) {
    for(Account ac:Trigger.New){
        if(ac.Type==null || ac.Phone==null){
            ac.addError('Please fill in the Type and PhoneNumber for the Record.');  
        }
        if(ac.Type=='Prospect'){
            ac.Industry='Agriculture';
        }
        else{
            ac.Industry='Banking';   
        }
        
    }
}
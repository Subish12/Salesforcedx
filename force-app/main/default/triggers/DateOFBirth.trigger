trigger DateOFBirth on Account (before insert) {
    for(Account Acc:Trigger.New){}
}
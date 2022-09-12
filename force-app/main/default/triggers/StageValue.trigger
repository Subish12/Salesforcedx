trigger StageValue on Opportunity (after insert,after Update) {
    
    for(Opportunity opp:Trigger.New){
        Opportunity ops = Trigger.OldMap.get(opp.Id);
        if(ops.StageName=='Closed Won' || ops.StageName=='Closed Lost'){
            opp.addError('sssssss');
            	/*if(opp.StageName=='Negotiation/Review'){
                ops.addError('sssssss');
            }  */
        }
        
    }
}
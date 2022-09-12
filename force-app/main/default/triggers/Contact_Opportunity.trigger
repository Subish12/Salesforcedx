trigger Contact_Opportunity on Account (after insert,after update) {
    list<contact> lst=new list<contact>();
    list<Opportunity> lst1=new list<Opportunity>();
    if(Trigger.isInsert){
        for(Account ac:Trigger.new)
        {
            Contact con=new Contact();
            con.FirstName='New One';
            con.AccountId=ac.Id;
            con.LastName=ac.Name;
            lst.add(con);
        }
        insert lst;
    }
    if(Trigger.isUpdate){
        for(Account ac:Trigger.new)
        {
            Opportunity opp= new Opportunity();
            opp.Name=ac.Name;
            opp.AccountId=ac.Id;
            opp.Description=ac.Description;
            opp.CloseDate=ac.SLAExpirationDate__c;
            opp.StageName=ac.Name;
            lst1.add(opp);    
        }
         insert lst1;

    } 
}
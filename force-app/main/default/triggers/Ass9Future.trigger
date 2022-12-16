trigger Ass9Future on Opportunity (after insert, after update, after delete) {
    Set<Id> AccIds = new Set<Id>() ;
if(trigger.isAfter){
    if(trigger.isInsert && trigger.isUndelete) {
        for(Opportunity opp : trigger.new){
            if(opp.accountId != null){
                AccIds.add(opp.accountId);
            }
        }
    }
if(trigger.isDelete){
    for(Opportunity opp : trigger.old){
        AccIds.add(opp.accountId);  

    }
}    
if(trigger.isUpdate){
    for(Opportunity oppNew : trigger.new){
        Opportunity opp =trigger.oldMap.get(oppNew.Id);
        AccIds.add(oppNew.accountId);
        AccIds.add(opp.accountId);
     }
}
week9OppUpdatehandler.oppupdateFuture(AccIds);
}
}
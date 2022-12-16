trigger TriggerAccount2 on Account (before update) {
    if(trigger.isBefore){
        if(trigger.isUpdate){
            List<Account> listAccOld = trigger.old;
            List<Account> listAccNew = trigger.new;
            for(Account acc : listAcc){
                if(Acc.Active__c == 'Yes'){
                    Acc.Description = 'Is Active' ; 
                } else {
                    Acc.Description = ' ' ; 
                }
            }
        }
    }
}
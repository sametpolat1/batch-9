trigger TriggerAccount3 on Account (before update) {
    if(trigger.isBefore){
        if(trigger.isUpdate){
            List<Account> listAccOld = trigger.old;
            List<Account> listAccNew = trigger.new;
            // for(Account accNew : listAccNew){
            //     for(Account accOld: listAccOld){
            //         if(accNew.id == accOld.id){
            //             if(accNew.Rating != accOld.Rating){
            //                     accNew.Description = 'Rating alaninda degisiklik yapilmistir.' ;
            //  }      
            //     }
            // }
         // }
            Account accOld ;
            for (Account accNew : listAccNew){
                accOld = Trigger.oldMap.get(accNew.id);
                if(accNew.Rating != accOld.Rating){
                 accNew.Description = 'Rating alaninda degisiklik yapilmistir.' ;   
                } else{
                    accNew.Description = 'Rating alanında değişiklik yapılma_mıştır.';
                }
                
            }
        }
    }
}
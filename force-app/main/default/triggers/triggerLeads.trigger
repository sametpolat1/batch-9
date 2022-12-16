trigger triggerLeads on Lead (before insert, after insert, before update, after update) {

 if(trigger.isBefore){
    if(trigger.isInsert) {
        system.debug('Before insert : Trigger.new ->  ' + trigger.new);
       List<Lead> lstLead = trigger.new ;
       for( Lead ekle: lstLead){
        ekle.Title = 'SoftInnovas' ; 
       }
       
    } 
    if(trigger.isUpdate){

    }

 }

 if(trigger.isAfter){
    if(trigger.isInsert) {
        system.debug('After insert : Trigger.new ->  ' + trigger.new);
        system.debug(trigger.new[0].title);
    } 
    if(trigger.isUpdate){
        
    }

 }
}
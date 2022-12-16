trigger Assigmentweek9Handtrigger on Case (before insert, after insert) {
    if(trigger.isAfter && trigger.isInsert){
        Assigmentweek9Handler.createChildCase(trigger.new, trigger.newMap);
    }
}
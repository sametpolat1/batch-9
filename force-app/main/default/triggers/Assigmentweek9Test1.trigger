trigger Assigmentweek9Test1 on Case (before insert, after insert) {
    if(trigger.isAfter && trigger.isInsert){
        Assigmentweek9Test.week9Test(trigger.new, trigger.newMap);
    }
}
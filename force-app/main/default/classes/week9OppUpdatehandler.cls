public class week9OppUpdatehandler {
    @future
    public static void  oppupdateFuture(Set<Id> accIds) {
     
        List<Account> Listacc = [Select Id, Highest_Amount_Opportunity_Name__c, (select name, amount from Opportunities where amount!= null ORDER BY amount DESC) from Account WHERE Id =:accIds];
        for(account acc : Listacc){
            if(acc.Opportunities.size()>0) {
                acc.Highest_Amount_Opportunity_Name__c = acc.Opportunities[0].name ;
            } else {
                acc.Highest_Amount_Opportunity_Name__c = null;
            }
        }
        update Listacc;
    }
}

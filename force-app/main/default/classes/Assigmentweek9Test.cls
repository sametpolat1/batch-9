@isTest
public class Assigmentweek9Test {
    @isTest
    private static void week9Test() {
        List<Case> ListC = new List<Case> ();
        for (integer i=0; i<200; i++){
        Case Cs = New Case ();
        Cs.Subject = 'Parent Case may contain secret info, do something NOW';
        CS.priority = 'High';
        Cs.Description = 'Test';
        ListC.add(Cs);
        }
        insert ListC; 
        List<Case> Cases = [select ID from Case] ;
        System.assertEquals(200, Cases.size());
    }
    
}

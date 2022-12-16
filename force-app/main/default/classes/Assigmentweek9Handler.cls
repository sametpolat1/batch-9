public class Assigmentweek9Handler {
    public static void createChildCase(List<case> casetriggernew ,
    Map<id, case> casetriggernewMap ){
        Set<id> CaseId = new Set<id> ();
        String P = 'Password';
        for(Case c : casetriggernew ){
            if( c.description.containsIgnoreCase(P)){
                caseId.add(c.Id);
            }
        }
      if(!CaseId.isEmpty()) {
        List<Case> ListC = new List<Case> ();
        for (Id eachId : CaseId){
        Case Cs = New Case ();
        Cs.Subject = 'Parent Case may contain secret info, do something NOW';
        Cs.ParentId = eachId;
        CS.priority = 'High';
        Cs.Description = 'Secret info not allowed in case';
        ListC.add(Cs);
        }
        insert ListC;
      }
    }
    }







public class Assignment {
    public static void insertAssignments() {
        Account acc1 = new Account();
        acc1.Name = 'Assignment 1';
        acc1.Phone = '1234';
        acc1.Website = 'www.sp.com.tr';
        acc1.Site= 'www.s.com.tr';
        insert acc1;
        system.debug('New records inserted : ' + acc1);

        // acc1.Name= 'Assignment 1-1' ;
        // acc1.Phone = '12233';
        // update acc1 ;


        Account acc2 = new Account();
        acc2.Name = 'Assignment 2' ;
        acc2.Phone= '56789';
        acc2.Website= 'www.ps.com.tr';
        acc2.Site = 'www.p.com.tr';
        insert acc2 ;
        system.debug('New records inserted: ' + acc2);
        // acc2.Name= 'Assignment 2-1' ;
        // acc2.Phone = '554466';
        // update acc2 ;
    }

    // public static void updateAssingments(){
    //     List<Account> accList= [SELECT name, phone from Account 
    //                             ORDER BY CreatedDate 
    //                             DESC LIMIT 2] ;
    //     List<Account> accUpdate = new List<Account>();  

    //     Account acc3 = new Accont();                        
    //     acc3.Name = 'Assignment 1-1' ;
    //     acc3.Phone = '12233';
    //     accUpdate.add(acc3);
        
    //     Account acc4 = new Account();
    //     acc4.Name= 'Assignment 2-1' ;
    //     acc4.Phone = '554466';
    //     accUpdate.add(acc4);

    //     update accUpdate ;
    // }

    public static void updateKayit(){
        List<Account> accList= [SELECT name, phone from Account 
                                ORDER BY CreatedDate 
                                DESC LIMIT 2] ;
        List<Account> accUpdate = new List<Account>(); 
        integer n = 2;
        for(account acc3 : accList){
            acc3.name = 'Assingment Update ' + n ;
            acc3.phone = '11233' + n ;
            n++;
            accUpdate.add(acc3);
        }
        update accUpdate;
    }

    public static void deleteKayit(){
        List<Account> deleteList= [SELECT name, phone from Account 
        ORDER BY CreatedDate 
        DESC LIMIT 2] ; 
        if(!deleteList.isEmpty()){
            delete deleteList;
        }
    }

    public static void addnewAccounts(){
        Account acc4 = new Account();
        acc4.name = 'For add Contact' ;
        acc4.phone = '123456';
        insert acc4;

     List<Contact> listCont = new List<Contact>();
     for( integer i = 1 ; i<6; i++){
        Contact c1 = new Contact();
        c1.AccountId = acc4.id;
        c1.FirstName = 'Contact Record ' + i;
        c1.LastName = ' C Record Last Name ' + i;
        listCont.add(c1);
     }   
      if(!listCont.isEmpty()) {
        insert listCont;
      }
    }

    public static void Kayit149(){
       List<Opportunity> newOpps = new List<Opportunity>();

       for(integer i = 1; i<150; i++){
        Opportunity n = new Opportunity();

        n.Type = 'New Customer';
        n.StageName = 'Qualification';
        n.CloseDate = Date.newInstance(2024, 02, 02);
        n.Name= 'Homework' + i ;
        n.Description = 'Someting like this';
        newOpps.add(n);
       }
       if(!newOpps.isEmpty()) {
        insert newOpps;
      }
    }

    public static void deleteOpp(){
        Opportunity[] delopp = [SELECT Id, Name 
                                FROM Opportunity
                                WHERE Name 
                                LIKE '%Homework%'];
        delete delopp;
    }

    public static void dmlUpdateDemo_1(){
        Account acc = new account();
        acc.Name = 'SoftInnovas';
        insert acc;

        acc.Name = 'Softınnovas Inc.';
        update acc;
    }
    public static void dmlUpdateDemo_3(){

       account acc = [select id, name from account where name = 'SoftInnovas' limit 1];

        acc.Name = 'SoftInnovas Inc.';
       update acc;
       system.debug('acc = ' + acc);
    }
}

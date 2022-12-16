public class AccConAndOppOperations {
    public static Decimal AccConAndOppOperations1() {
        List<Opportunity> listOpp = [SELECT id, name, amount 
                                     FROM Opportunity 
                                     WHERE StageName = 'Closed Won' and amount != NULL];
        decimal sum = 0;
        if(listOpp != null && listOpp.size()>0){  // DML işlemi yapmadığım için if conditiona gerek yok.
            for (Opportunity eachOpp : listOpp) {
                sum += eachOpp.Amount;// bir başlangıç degeri atamam gerekir. başlangıc 0 yapmazsam null olur. null'a ekleme yapılamaz.
            }
            System.debug('Sum of Amount with Closed Won : ' + sum + 
            '  and Closed Won Records size : ' + listOpp.size());
        }
        return sum;
    }


 //select id, name, (select accountId from Opportunities where stageName = 'Closed Won') FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE StageName = 'Closed Won');


    public static List<Account> accOpp(string StgName){
        List<Account> mylistAcc = new List<Account>();
        List<Account> listAcc = [select AccountId from];
        
        //[select name, (select StageName from Opportunities where stageName = :StgName) FROM Account]; // en az bir opportuniyisi olan accounları getir.
        if(listAcc != null && listAcc.size()>0){
            for (Account eachAcc : listAcc) {
                if(eachAcc.opportunities != null && eachAcc.Opportunities.size()>0){
                    mylistAcc.add(eachAcc);
                }
            }
            System.debug('My List Acc : ' + mylistAcc ); 
            System.debug(' and The number of records with StageName: ' + StgName  + ':' + listAcc.size() );
            
        }  
      return mylistAcc;
    }


    public static List<Contact> accCon(){
        List<Contact> mylistCon = new List<Contact>();
        List<Contact> listCon = [select Name, AccountId,Account.Name FROM Contact];
        if(listCon != null && listCon.size()>0){
            for (Contact eachCon : listCon) {
                if(eachCon.Account != null && eachCon.Name.length()>0){
                    mylistCon.add(eachCon);
                }
            }
            System.debug('My List Con : ' + mylistCon ); 
            System.debug(' and The number of records with Account Name: ' +  ':' + listCon.size() );
            
        }  
      return mylistCon;
    }


//1.3
    public static list<account> accWithCon() {
        list<account> accOList=[select id ,name 
                                from account where id in (select accountid from contact)];
        System.debug(accOList);
        System.debug('size '+accOList.size());
        return accOList;
        
    }


    //3.1
    public static void addCont(string accid) {
        account a1=[select id,name from account where id=:accid];
        contact c1=new contact();
        c1.lastname=a1.name;
        c1.accountid=a1.id;
        c1.title='Practice week-5 Ekstra 3.1 icin';
        System.debug('contact has been created successfully ');
    
        insert c1;
    }
    //3.2
    public static void updateOpp() {
        list<opportunity> myOpp=[ select name, amount,description from Opportunity where amount >0 order by amount  desc limit 10 ];
         for(opportunity each: myOpp){
            each.description='This is one of the top 10 opportunities.Please work on this properly';
         }
         System.debug('all is good');
         update myOpp; 
    }
    //3.3
    public static list<Opportunity> myOpp2(string acid,integer n) {
        account a1=[select id,name from account where id=:acid];
        List<Opportunity> opp2=new List<Opportunity>();
        if(n>0){
            for (Integer i = 0; i < n; i++) {
                opportunity opp1=new opportunity();
                opp1.closedate=date.today().addyears(3);
                opp1.stagename='Prospecting';
                if(a1.annualrevenue !=null){
                 opp1.amount=a1.annualrevenue/n;   
                }
                opp1.accountId=a1.id;
                opp1.name=a1.name;  
                opp2.add(opp1);
                System.debug(opp1);
            }
            insert opp2;
    
        }else{
            System.debug('Please tell us how many opportunities needs to be created');
        }
    
        return opp2;   
    }


    //3.4
public static void accNoCon() {
    list<account> listem= [select id ,name from account where id not in (select accountid from contact)]; // contactları olmayan accounları getirdik
    list<contact> kisiler= new list<contact>();
    for (account eachA : listem) {
        contact c1=new contact();
        c1.lastname=eachA.name;
        c1.accountid=eachA.id;
        kisiler.add(c1);
        System.debug(c1);
      
    }
    if(!kisiler.isEmpty()){
        insert kisiler;
    }
    
}
    
    //3.5
    public static void temizlee() {
        list<opportunity> sonListe=[select name,amount from opportunity where amount<200000 and StageName='Closed Won'];
        System.debug(sonListe);
        delete sonListe;
    
}   
    
    
}

    
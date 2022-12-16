public with sharing class MyCity {
    public void cityInformation() {
        string myCity = 'Paris';
        string myCountry = 'France';
        string MyCandC = 'Gezmek istedigim ulke : ' + myCountry+ ', gezmek istedigim sehir : ' + myCity ;
        system.debug(MyCandC);

        date country = date.newInstance(1921,06,27);
        system.debug('Kocaelinin kurulus tarihi:' +  country);
        Time sunrise = time.newInstance(07,03,00,00);
        system.debug('Kocaeli-Basiskele gun dogumu: ' + sunrise);
        Date todayIs =date.today();
        Datetime daysRemove = todayIs.addDays(-36);
        system.debug('Bugunun tarihi : '+ todayIs + 'dir.  Bugunden 36 gun oncesi ise :  ' + daysRemove);
    }
    public void stringMethod(){
        string a = 'I am a Salesforce Developer';
        Boolean b = a.contains('force');
        system.debug( 'Cumlede "force" kelimesi var mı ? ' + b);
        integer c= a.length();
        system.debug('"I am a Salesforce Developer" cumlesinde ' + c + ' karakter vardır.');
        String d = a.touppercase();
        system.debug(d);
        } 

public void dateMethod(){
    date todayIs =date.today();
    system.debug('Bugunun tarihi :'+todayIs);
    Datetime DayTime = Datetime.now();
    system.debug('Su an :'+DayTime);
    Datetime hoursAdd = DayTime.addHours(50);
    system.debug('50 saat eklenmis hali: '+hoursAdd);
}

public string favoriteCafe;
public string favoritePark;
public string favoriteMall;
public string favoriteStore;

public string myFavoriteLocations(string city){
System.debug('The most beautiful Cafe in my city= ' + favoriteCafe + 'most beautiful park= ' + favoritePark + ' most beautiful mall= ' + favoriteMall+ ' most beautiful store = ' + favoriteStore) ;
return city ;
}

public void printString(integer n, String Message){
    for (integer i=1; i<= n; i++) {
    System.debug(Message + ' ' + i);        
    }
}
}

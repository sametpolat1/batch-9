public class PlayingWithDates {
    public void printDateOutput() {
        date todayDate = date.today();
        system.debug('3.a Today date is : ' + todayDate);

        date newDate = date.newInstance(2789, 11, 5);
        date newDate2 = date.newInstance(1459, 3, 4);
        system.debug('3.b want to date is:' + newDate);
        system.debug('3.c want to date is:' + newDate2);

        integer dayInt = 10;
        integer monthInt = 11;
        integer yearInt = 1938;
        
       date ataturk = date.newInstance(yearInt, monthInt, dayInt);

        system.debug('3.d Ataturk:' +  ataturk);
    }
}

Date MarieCurieBD = date.newInstance(1867, 11, 07);
Date todayIs =date.today();
system.debug('Bugunun tarihi : '+ todayIs + 'dir.  Marie Curie dogum tarihi :  ' + MarieCurieBD);

integer dayDifference = MarieCurieBD.daysBetween(todayIs);
integer differenceDay = dayDifference / 365;
system.debug('Farkın gun dikkate alınarak hesaplanması : ' + differenceDay);

integer monthDifference = MarieCurieBD.monthsBetween(todayIs);
integer differenceMonth = monthDifference / 12;
system.debug('Farkın ay dikkate alınarak hesaplanması : ' + differenceMonth);

integer yearDifference = todayIs.year();
integer MarieCurieBD2 = MarieCurieBD.year();
integer differenceYear =yearDifference - MarieCurieBD2  ; 
system.debug('Farkın yil dikkate alınarak hesaplanması : ' + differenceYear);

Boolean isLeapYear = date.isLeapYear(MarieCurieBD2);

System.debug('Marie Curie\'nin dogum tarihi artık yıl mı ? :' + isLeapYear);
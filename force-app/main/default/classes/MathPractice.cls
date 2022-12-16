public class MathPractice {
    public Decimal practiceOne(Decimal a, Decimal b) {
        system.debug('Birinci parametre : ' + a);
        system.debug('ikinci parametre: ' + b);
        Decimal dikdortgencevre = 2*(a + b);
        system.debug('Dikdortgen cevre uzunlugu: ' + dikdortgencevre);
        return dikdortgencevre ;
    }
    public Decimal practiceTwo(Decimal boy, Decimal kilo){
        system.debug('Kilo : ' + kilo);
        system.debug('Boy : ' + boy) ;
        Decimal kitleEndeks = kilo / (boy*boy);
        system.debug('Kitle endeks : ' + kitleEndeks);
        return kitleEndeks ; 
    }
    public Decimal practiceThree(Decimal num1, Decimal num2){
        system.debug('Birinci deger: ' + num1);
        system.debug('Ikinci deger: ' + num2);
        Decimal ortalama = (num1 + num2) / 2 ;
        system.debug('iki sayinin ortalamasi: ' + ortalama);
        return ortalama;
    }

    public static Decimal practiceFour(decimal total){
        Decimal bonus;
        if(total<=0){
            bonus=10;
            system.debug('hatali bir deger girdiniz');
        } else if (total>0 && total <=49) {
            system.debug('bunus kazanadınız');
        }else if(total>49 && total <=199){
            bonus=10;
            system.debug(total + '$ tutarında ki alışveriş karşılığı ' + bonus + ' $ tutarında bonus kazandınız.');
        }else if( total>199 && total <=499){
            bonus=30;
            system.debug(total + '$ tutarında ki alışveriş karşılığı ' + bonus + ' $ tutarında bonus kazandınız.');
        }else{bonus=50;
            system.debug(total + '$ tutarında ki alışveriş karşılığı ' + bonus + ' $ tutarında bonus kazandınız.');
        }
        return bonus;
    }

    public static Decimal practiceFive(integer p, string t){
        integer total;
        switch on t {
            when 'EKMEK' {
                total= 1*p;
            }when 'SİMİT'{
                total=2*p;
            }when 'KEK' {
                total=3*p;
            }
        }
        system.debug('Almış oldugunuz ' +p+ ' adet ' + t+ ' tutarı ' + total+ ' $ \'dır.');
        return total;

    }

    public Decimal practiceSix(Decimal kisaKenar, Decimal uzunKenar, string islem){
        Decimal result;
        switch on islem {
            when 'cevre' {
            result = math.roundToLong(2* (kisaKenar+uzunKenar));                
            }when 'alan'{
                result = kisaKenar * uzunKenar ;
                result = result.round(RoundingMode.HALF_UP);
            } when else {
                System.debug('Lütfen geçerli bir işlem türü giriniz!.');
            }
        }
        return result ;
    }
    public string practiceSeven(Decimal boy, Decimal kilo){
        //  system.debug('Kilo : ' + kilo);
        //  system.debug('Boy : ' + boy) ;
        Decimal kitleEndeks = kilo / (boy*boy);
        system.debug(kitleEndeks.setScale(1));

        string result; 
        if(kitleEndeks>=0 && kitleEndeks <=18.4) {
            result= 'Zayıf' ;
        }else if(kitleEndeks > 18.4 && kitleEndeks <=24.9){
            result = 'Normal';
        }else if(kitleEndeks> 24.9 && kitleEndeks<=29.9){
            result = 'Kilolu';
        }else {
            result ='Girmiş oldugunuz boy ve kilo değerlerini kontrol ediniz.' ;
        }
        return result;
    }

    public integer practiceEight(integer x, integer y){
        integer deger=0;
        if(x==y){
            deger = x + y;
            system.debug( 'x ve y eşittir, toplamları: ' + deger);
        }else {
            for( integer i=x; i<=y; i++){
                deger += i ;
            }
            system.debug('iki parametre arasında ki değerlerin toplamı : ' + deger);
        }
return deger;
    }
}

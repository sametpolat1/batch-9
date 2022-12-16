public class OperationsHelper {
    public void largestOutOfTwoNumbers(Decimal a, Decimal b) {
        if( a > b){
            system.debug('a : ' + a) ;
        }
        else ( system.debug(' b:' + b));
    }
    public Decimal smallestOutOfThreeNumbers(Decimal c, Decimal d, Decimal e){
        if (c <= d && d <= e) {
            return c;
        }
        else if ( c <= e && d <=c) {
            return d ;
        }
        return e ;            
        
    }
    public static integer add(List<integer> intList){
       integer Sum = 0;
       for (integer eachInteger : intList) {
        if ( eachInteger >= 0) {
           Sum =  Sum + eachInteger; 
        }
        else system.debug('We are not calculating the sum for negative numbers') ;
       }  system.debug(' Sum is:' + Sum);
        return Sum;
       
   }

   public integer sumofPositiveIntegers(integer n) {
    integer Sum = 0;
    if(n < 0) {
        Sum = null;
        system.debug('We are not calculating the sum for negative numbers') ;
    }
    else {
        Sum = 0;
        for (integer i = 1; i<=n ; i++){
            Sum = Sum + i;
        }
    }return Sum ;

   }

}
public class Planets {
        public string planetName;
        public integer solarsystemNumber;
        public integer numberOfTheMoons;
    
        public void print_Int(){
                integer count = 1;
                while(count >=-25){
                        system.debug(count);
                        count -- ;
                }
        }

        public static void a(){
                List<String> b = new List<String>();
                b.add ('samet');
                b.add(' polat') ;
                system.debug('List string ' + b) ;
        }
        public static void a2(){
                List<String> b2 = new List<String>();
                b2.add ('şeyda');
                b2.add(' polat') ;
                b2.add ('ahmet emin');
                b2.add ('polat');
                system.debug('List string is // ' + b2) ;
        }
        public static void a3(){
                List<integer> b3 = new List<integer>{10,15,20,21,15,18};
                b3.add (30);
                b3.add(40) ;
               
                system.debug('List string is // ' + b3) ;
        integer indexvalue = b3.get(5);
        system.debug('5.deger = ' + indexvalue);
        integer indexvalue2 = b3[3];
        system.debug('3.deger = ' + indexvalue2);
        }

        // public static void varMiyokMu(){

        //         List<String>  = new List<String>();
        //         b.add ('samet');
        //         b.add(' polat') ;
        //         system.debug('List string ' + b) ;
        // }


        public static void ListDemo(){
                List<integer> listInteger = new List<integer>();
                listInteger.add(5);
                listInteger.add(6);
                listInteger.add(7);
                listInteger.add(8);
                for(integer i= 0; i< listInteger.size() ; i++ ){
                        integer a = listInteger[i];
                        System.debug(a);
                }

                //for - each döngüsü
                for(integer  b : listInteger){
                        system.debug(b);
                }
        }
       
        
}

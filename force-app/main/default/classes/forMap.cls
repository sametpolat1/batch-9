public with sharing class forMap {
    public forMap() {
map<string,string> mapCountry = new Map<String,string>();
mapCountry.put('USA' , 'Dollar');
mapCountry.put('France' , 'Euro');
mapCountry.put('India' , 'Ruppes');
mapCountry.put('India' , 'Rupee');
mapCountry.put('Turkiye' , 'Lira');
mapCountry.put('El Salvador' , 'Bitcoin');
mapCountry.put('Canada' , 'Dollar');
System.debug(mapCountry);

    }
}

public class ValidateAddress {
    public void ValidateHomeAddress () { 
       
        string HouseName='Home ';
        string StreetName='Home Canak';
        String CityName='Istanbul';
        string StateName='Istanbul';
        string ISOcode= 'TR';
        String CountryName='Tr';
        String CountryIsoCode= 'acs';
        
       
        // system.debug('HouseName:' + HouseName);
        integer lenghtOfStrt = StreetName.length();
        system.debug('The number of characters in the street name...'+ lenghtOfStrt);
        Boolean ContainsHouseName = StreetName.contains(HouseName);
        system.debug('Contains Canak?' + ContainsHouseName);
        Boolean ContainsIsocode = StreetName.contains(ISOcode);
        system.debug('Contains TR?' + ContainsIsocode);
        
        string uppers = ISOcode.toUpperCase();
        system.debug('Upper?' + uppers);
        string upper = CountryName.toUpperCase();
        system.debug('Upper?' + upper);
        string upper1 = CountryIsoCode.toUpperCase();
        system.debug('Upper?' + upper1);
        string lowers = StateName.toLowerCase();
        system.debug('Lower?' + lowers);
         
        string lower1 = CityName.toLowerCase();
        system.debug('Lower?' + lower1);
        
        String s = HouseName + ' ' +StreetName + ' ' +CityName+ ' ' + StateName+ ' ' + CountryName;
        system.debug('Full address...' + s);  
        
    
    }
}
public class getaccountmap {
    @AuraEnabled
    public static list<locationwrapper>getaccount(){
        list<locationwrapper>acctwrpprlst = new list<locationwrapper>();
        list<Account>acclist = new list <Account>();
        acclist = [Select Name,description, BillingCountry, BillingCity, BillingPostalCode, BillingStreet, BillingState
                   From Account
                   Where BillingCountry != null
                   And BillingCity != null
                   limit 10];
        system.debug('acclist---'+acclist);
        system.debug('Acclist****'+acclist.size());
        for( Account acc : acclist){
            accountdatawrapper accwrpper = new accountdatawrapper();
            accwrpper.street = acc.BillingStreet;
            accwrpper.city = acc.BillingCity;
            accwrpper.state = acc.BillingState;
            accwrpper.PostalCode = acc.BillingPostalCode;
            accwrpper.Country = acc.BillingCountry;
            //acctwrpprlst.add(accwrpper);
            locationwrapper locwrapper = new locationwrapper();
            locwrapper.location = accwrpper;
            locwrapper.title = acc.Name;
            locwrapper.icon = 'utility:location';
            locwrapper.description = acc.Description;
            acctwrpprlst.add(locwrapper);
            
            
        }
        
        
        return acctwrpprlst;
        
    }
    
    public class accountdatawrapper{
        @AuraEnabled
        public string street;
        @AuraEnabled
        public string city;
        @AuraEnabled
        public string state;
        @AuraEnabled 
        public string PostalCode;
         @AuraEnabled 
        public string Country;
       
    }
    
    public class locationwrapper{
        @AuraEnabled
        public string title;
        @AuraEnabled 
        public string icon;
        @AuraEnabled
        public string description;
        @AuraEnabled
        public accountdatawrapper location;
        
    }
    
    
}
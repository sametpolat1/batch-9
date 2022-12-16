// Task: LWC to fetch ACcount Metadata Information
// Solution/Approach : Using UI API to acheive it
// JS : Step 1 - import UI Apis
// Step 2 - Wire decorator to get schema details
// HTML : Step 3 - Display the metadata information whatever we got from JS
// Metadat: Step 4 - Expose LWC to Apppages/Homepages
// LWC world - 3 decorators - track (to make datatypes reactive), wire (it will interact with ui apis/apex/any server resources), api (public attribute)



// Decorators(track,api,wire) are always imported from LWC featureset 
import { LightningElement, track,api,wire } from 'lwc';

//ımported User Interface Api-- ObjectInfoApi
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
//import account object info
import ACCOUNT_OBJECT from '@salesforce/schema/Account';


export default class GetObjectInfoAccount extends LightningElement {
    //Local JS properties 
    recordTypeId;
    idPrefix;
    fields;
    error;
    accountNumber;
    accountSource;



    //Invoke Wire decorator to make Server interaction
    //in this scenario, Server interaction is happining with use of UI Api
    //In future, we will use Wire to interact with apex(Server Resourse) 
@wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT}) // (metor ve parametre)
    //Link Wire decorator with either JS method/function or Local properties
    //In this scenario, we will tacch it with JS method.
    accountInfoHandler({data,error}){
        //condition Expression--Null Check
        if(data){
            console.log(data);
            //Extracting useful information from UI Api response, i.e., Account metadata
            this.recordTypeId = data.defaultRecordTypeId;
            this.idPrefix = data.keyPrefix;
            this.fields = data.fields;
            this.accountNumber = data.fields.AccountNumber.apiName;
            this.accountSource = data.fields.AccountSource.apiName;
        }else{
            console.log(error);
            this.error = error;
        }

    
}
}
import { LightningElement, wire, track } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetPicklistValuesAccount2 extends LightningElement {

    @track industryValues= [];

    @wire(getPicklistValues, { fieldApiName : INDUSTRY_FIELD,
         recordTypeId : '012000000000000AAA' })
    picklistHandler( { data, error } ){
        if(data){
            console.log(data.values);
            let options= [];
           for(const element of data.values){
            let singleValueObj = {
                label : element.label,
                value: element.value
            };
            options.push(singleValueObj);
           }
           this.industryValues = options;
        } else {
            console.log(error);
        }
    }

    
}
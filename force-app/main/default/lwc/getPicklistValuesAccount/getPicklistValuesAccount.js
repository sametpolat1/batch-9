import { LightningElement, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetPicklistValuesAccount extends LightningElement {

    industryValues= [];

    @wire(getPicklistValues, { fieldApiName : INDUSTRY_FIELD,
         recordTypeId : '012000000000000AAA' })
    picklistHandler( { data, error } ){
        if(data){
            console.log(data);
            this.industryValues = this.picklistGenerator(data);
        } else {
            console.log(error);
        }
    }

    picklistGenerator(data){
        return data.values.map(item => ({
            label : item.label,
            value : item.value
        }));
    }
}
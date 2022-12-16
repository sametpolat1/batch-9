import { LightningElement, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi'
import TYPE_FIELD from '@salesforce/schema/Account.Type';

export default class GetPicklistValuesAccountType extends LightningElement {

    typeValues= [];

    @wire(getPicklistValues, { fieldApiName : TYPE_FIELD,
         recordTypeId : '012000000000000AAA' })
    picklistHandler( { data, error } ){
        if(data){
            console.log(data);
            this.typeValues = this.picklistGenerator(data);
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
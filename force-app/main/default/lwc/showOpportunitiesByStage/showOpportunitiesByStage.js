import { LightningElement, wire } from 'lwc';
import { getPicklistValues, getObjectInfo } from "lightning/uiObjectInfoApi";
import getOppsByType from "@salesforce/apex/OpportunityController.getOppsByType";
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';

export default class ShowOpportunitiesByStage extends LightningElement {

    opportunityDefaultRTId;
    typeOptions = [];
    selectedValue;
    opps;
    error;

    @wire(getObjectInfo, { objectApiName : OPPORTUNITY_OBJECT })
    objectInfoHandler( { data, error } ) {
        if(data){
            this.opportunityDefaultRTId = data.defaultRecordTypeId;
            console.log(data);
        }
        if(error){
            console.log(error);
        }
    }

    @wire(getPicklistValues, { fieldApiName : TYPE_FIELD, recordTypeId: '$opportunityDefaultRTId' } )
    picklistHandler( { data, error } ) {
        if(data){
            console.log(data.values);
            let options = [];
            for (const element of data.values) {
                let singleValueObj = {
                    label : element.label,
                    value : element.value
                };
                options.push(singleValueObj);
            }
            this.typeOptions = options;
        } else {
            console.log(error);
        }
    }

    changeHandler(event){
        this.selectedValue = event.target.value;
        //Called Apex Impreartively
        // Return Type - PROMISE
        getOppsByType( { typeNameInput : this.selectedValue } )
            .then(result => {
                this.opps = result;
                console.log(result);
            })
            .catch(error => {
                this.error = error;
                console.log(error);
            })
    }
}
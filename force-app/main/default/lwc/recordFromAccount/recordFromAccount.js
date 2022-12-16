import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordFormAccount extends LightningElement {

    objectName = ACCOUNT_OBJECT;
    fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD];

    showSuccessMessage(event){
        //Fire Toast Event
        const successToast = new ShowToastEvent({
            title: 'Success',
            message: 'Account record successfully created!',
            variant: 'success'
        });
        this.dispatchEvent(successToast);
    }

    // LWC is Metadata independent --
    //If you need anything from Salesforce, you have to Import it. - Schema, Apexclass, Fields, custom label
    //Lightning Record Form is Metadata drivven
    //We do not need to write Server(Apex) logic in the case of Lightninfg Record form as Record creation/updation is taken care by Lightning Data Service
}
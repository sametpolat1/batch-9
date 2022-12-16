import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CASE_OBJECT from '@salesforce/schema/Case';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';

export default class CaseAssingment extends LightningElement {
   
    objectName = CASE_OBJECT;
    recordId= "5008d000008bdhBAAQ";
    fields = {
        subject : SUBJECT_FIELD,
        priority : PRIORITY_FIELD,
        status : STATUS_FIELD,
        description : DESCRIPTION_FIELD,
        origin: ORIGIN_FIELD,
        account: ACCOUNT_FIELD,
        contact: CONTACT_FIELD
    };

    showSucessToastMessage(){
        const successToast = new ShowToastEvent({
            title : 'Success',
            variant : 'success',
            message : 'Case has been created successfully!'
        });
        this.dispatchEvent(successToast);
    }
    showErrorToastMessage(){
        const errorToast = new ShowToastEvent({
            title : 'Error',
            variant : 'error',
            message : 'Case creation failed! :('
        });
        this.dispatchEvent(errorToast);
    }



}
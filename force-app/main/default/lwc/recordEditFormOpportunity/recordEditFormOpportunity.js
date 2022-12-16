import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class RecordEditFormOpportunity extends LightningElement {

    objectName = OPPORTUNITY_OBJECT;
    showContent = true;
    fields = {
        name : NAME_FIELD,
        closedate : CLOSEDATE_FIELD,
        stage : STAGE_FIELD,
        amount : AMOUNT_FIELD,
        account : ACCOUNT_FIELD
    };

    showSucessToastMessage(){
        const successToast = new ShowToastEvent({
            title : 'Success',
            variant : 'success',
            message : 'Opportunity has been created successfully!'
        });
        this.dispatchEvent(successToast);
    }
    showErrorToastMessage(){
        const errorToast = new ShowToastEvent({
            title : 'Error',
            variant : 'error',
            message : 'Opportunity creation failed! :('
        });
        this.dispatchEvent(errorToast);
    }
}
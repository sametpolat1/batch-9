import { LightningElement } from 'lwc';


import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import  CASE_OBJECT from '@salesforce/schema/Case';
import  SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import  PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import  STATUS_FIELD from '@salesforce/schema/Case.Status';
import  CASENUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';

export default class RecordFromCase extends LightningElement {
    objectName= CASE_OBJECT; 
    showContent = true;
    fields = [
        SUBJECT_FIELD, PRIORITY_FIELD,STATUS_FIELD, CASENUMBER_FIELD];

        showSucessToastMessage(){
        const successToast = new ShowToastEvent({
            title:'Success',
            variant:'success',
            message: 'Case record has been created successfully'
        });
        this.dispatchEvent(successToast);
 }
    showErrorToastMessage(){
        const errorToast = new ShowToastEvent({
            title:'Error',
            variant:'error',
            message: 'Case record creation failed!'
        });
        this.dispatchEvent(errorToast);
    }    
   




}
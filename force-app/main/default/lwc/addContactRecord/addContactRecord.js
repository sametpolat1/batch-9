//Task: Create Contact Record

//HTML: Lot of Input Fields
// JS we will import UI Apis
// Wire ADdapter will use createRecord feature

import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { ShowToastEvent  } from 'lightning/platformShowToastEvent';

export default class AddContactRecord extends LightningElement {

    formdata = {};
    changeHandler(event){
        let name = event.target.name;
        let value = event.target.value;
        this.formdata[name] = value;
    }

    createContact(){
        //We are ready with Card details
        const recordInput = {
            apiName : CONTACT_OBJECT.objectApiName,
            fields : this.formdata
        };

        //Ordered Pizza
        createRecord(recordInput)
            .then(result => {
                // result is pizza
                //Watching Netflix
                console.log(result);
                const toast = new ShowToastEvent({
                    title: 'Success',
                    message : 'Contact record successfully inserted !',
                    variant : 'success'
                });
                this.dispatchEvent(toast);
            })
            .catch(error => {
                console.log(error);
                const toast = new ShowToastEvent({
                    title: 'Error',
                    message : 'Contact record insertion failed ! :(',
                    variant : 'error'
                });
                this.dispatchEvent(toast);
            })

    }

}
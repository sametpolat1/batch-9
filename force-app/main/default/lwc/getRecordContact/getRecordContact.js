import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
//import Name from '@salesforce/schema/Account.Id';

import ACCOUNTID_FIELD from '@salesforce/schema/Contact.Account.Name';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import Phone from '@salesforce/schema/Contact.Phone';
import Department from '@salesforce/schema/Contact.Department';


const FIELDS = [
    ACCOUNTID_FIELD, FirstName,LastName,Email,Phone,Department
];

export default class GetRecordContact extends LightningElement {
    accountName;
    firstName;
    lastName;
    email;
    phone;
    department;

    @wire(getRecord, {recordId: '0038d00000EjJ0fAAF', fields: FIELDS  })

    accountHandler( {data, error}){

        if(data){
    
        console.log(data)
        this.accountName = data.fields.Account.displayValue;
        this.firstName = data.fields.FirstName.value;
        this.lastName = data.fields.LastName.value;
        this.email = data.fields.Email.value;
        this.phone = data.fields.Phone.value;
        this.department = data.fields.Department.value;
        
        }if(error){
            console.log(error);
        }
    
        }

}
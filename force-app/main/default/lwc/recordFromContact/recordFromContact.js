import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';



export default class RecordFromContact extends LightningElement {

objectName= CONTACT_OBJECT;
fields=[FIRSTNAME_FIELD, LASTNAME_FIELD,ACCOUNTID_FIELD,TITLE_FIELD,EMAIL_FIELD,PHONE_FIELD];


}
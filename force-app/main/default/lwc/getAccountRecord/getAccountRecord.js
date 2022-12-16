import { LightningElement, wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import Type_FIELD from '@salesforce/schema/Account.Type';
import Revenue_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import Rating_Field from '@salesforce/schema/Account.Rating';


 const FIELDS = [
        NAME_FIELD,INDUSTRY_FIELD,Type_FIELD,Revenue_FIELD,Rating_Field
    ];
   

export default class GetAccountRecord extends LightningElement {

    name;
    industry;
    type;
    revenue;
    rating;


   

    @wire(getRecord, {recordId: '0018d00000Dgz20AAB', fields: FIELDS  })

    accountHandler( {data, error}){

    if(data){

    console.log(data)
    this.name = data.fields.Name.value;
    this.industry = data.fields.Industry.value;
    this.type = data.fields.Type.value;
    this.revenue = data.fields.AnnualRevenue.value;
    this.rating = data.fields.Rating.value;
    
    }if(error){
        console.log(error);
    }

    }

}
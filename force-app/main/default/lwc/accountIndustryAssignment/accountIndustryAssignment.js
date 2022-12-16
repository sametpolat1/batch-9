import { LightningElement,wire } from 'lwc';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import Type from '@salesforce/schema/Account.Type';
import AccountName from '@salesforce/schema/Account.Id';
import AnnualRevenue from '@salesforce/schema/Account.AnnualRevenue';
import getAccountsIndustryinApex from '@salesforce/apex/AccountController.getAccountsIndustryinApex';

const COLUMNS = [
    {label: 'Account Name', fieldName: 'Name', type: 'text'},
    {label: 'Account Type', fieldName: 'Type', type: 'text'},
    {label: 'Industry', fieldName: 'Industry', type: 'text'},
    {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'text'},
    
    
]


export default class AccountIndustryAssignment extends LightningElement {
    selectedIndustry = [];
    accounts;
    columns = COLUMNS;
    selectedValue;
    error;
    accountDefaultRTId;


    @wire(getObjectInfo, { objectApiName : ACCOUNT_OBJECT })
    objectInfoHandler( { data, error } ) {
        if(data){
            this.accountDefaultRTId = data.defaultRecordTypeId;
            console.log(data);
        }
        if(error){
            console.log(error);
        }
    }

    @wire(getPicklistValues, { fieldApiName : INDUSTRY_FIELD,
        recordTypeId: '$accountDefaultRTId' })
        picklistHandler({data,error}){
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
              this.selectedIndustry= options;
            }else {
                console.log(error);
            }
            }
        
    


    changeHandler(event){
        this.selectedValue = event.target.value;
        //Called Apex Impreartively
        // Return Type - PROMISE
        getAccountsIndustryinApex( { selectedIndustry : this.selectedValue } )
            .then(result => {
                this.accounts = result;
                console.log(result);
            })
            .catch(error => {
                this.error = error;
                console.log(error);
            })
    }

    
    
}
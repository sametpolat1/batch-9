//Task : To show 10 Account details on LWC in a tabular form

//Solution: Wire approach to interact with APex (Wire APex Methods)
// Step 1: Create Apex Class and define a method to return 10 account records
// Step 2: Exposing that Apex method by annotaating @AuraEnabled
// Step 3: JS - Import Apex method/feature using @Salesforce/apex..... tag
// Step 4: JS - Wire decorators are used to link APex method with LWC
// Step 5: HTML - lightning-datatable to display data in tabular form

import { LightningElement, wire } from 'lwc';
import getAccountsApex from '@salesforce/apex/AccountController.getAccountsApex';

const COLUMNS = [
    {label : 'Account Name', fieldName: 'Name', type: 'text'},
    {label : 'Account Type', fieldName: 'Type', type: 'text'},
    {label : 'Industry', fieldName: 'Industry', type: 'text'},
    {label : 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency'}
];

export default class GetAccounts extends LightningElement {
    columns = COLUMNS;
    @wire(getAccountsApex)
    accounts;
}
import { LightningElement, wire } from 'lwc';
import getOppsAmountTop10 from '@salesforce/apex/OpportunityControllerForAssignment.getOppsAmountTop10';

const COLUMNS = [
    {label : 'Opportunity Name', fieldName: 'Name', type: 'Text'},
    {label: 'Type', fieldName:'Type', type: 'Text'},
    {label:'StageName', fieldName:'StageName', type:'Text'},
    {label: 'Amount', fieldName:'Amount', type:'currency'}
]

export default class GetOppAmountTop10 extends LightningElement {
    columns = COLUMNS;
    @wire(getOppsAmountTop10)
    opportunityAmountTop10;
}
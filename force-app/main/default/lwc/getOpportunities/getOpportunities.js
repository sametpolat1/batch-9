import { LightningElement, wire } from 'lwc';
import getOppsByStage from '@salesforce/apex/OpportunityController.getOppsByStage';

const COLUMNS = [
    {label: 'Opportunity Name', fieldName: 'Name', type: 'text'},
    {label: 'Type', fieldName: 'Type', type: 'text'},
    {label: 'Amount', fieldName: 'Amount', type: 'currency'},
    {label: 'Stage', fieldName: 'StageName', type: 'text'},
    {label: 'Account Name', fieldName: 'AccountName', type: 'text'}
    
]

export default class GetOpportunities extends LightningElement {

    stageName = 'Closed Won';
    columns = COLUMNS;
    opportunities;
    error;

        // Wire adapter is attched to a naked local properties. it will have two inner properties .data and .error
    // But if Wire adapter is attached to a function/method in JS then data and error will be the driving parameters

    @wire(getOppsByStage, {stageNameInput : '$stageName'})
    processOpportunityRecords ({data,error}){
        console.log(data);
        if(data){
            this.opportunities = data;
            let preparedDatas = [];
            this.opportunities.forEach(element => {
                let preparedData = {};
                preparedData.Id = element.Id;
                preparedData.Name = element.Name;
                preparedData.Type = element.Type;
                preparedData.Amount = element.Amount;
                preparedData.StageName = element.StageName;
                console.log(element.Account.Name);
                preparedData.AccountName = element.Account.Name;
                preparedDatas.push(preparedData);
            });
            this.opportunities= preparedDatas; 
        }
        if(error){
            this.error= error;
        }
        
    }
}
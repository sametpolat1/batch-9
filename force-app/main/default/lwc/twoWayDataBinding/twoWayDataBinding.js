import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {

    name = '';
    label = 'Enter Name';
    location = {
        country: 'Turkey'
    };
    handleChange(event){
        this.name = event.target.value;
    }
    
}
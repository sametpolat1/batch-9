import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {
    titles = 'Architect'
    @track contact = {
        name: 'Samet',
        stay : 'Kocaeli',
        title: 'Salesforce Developer'

    }
    handleChange(event){
        this.contact.title = event.target.value;
        console.log(event.target.value);
    }
    num1 = 16;
    num2 = 20;
    get sumOfNumbers(){
        return this.num1 + this.num2;
    }
}
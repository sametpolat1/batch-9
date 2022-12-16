import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {

    titles = ['Developer', 'Admin', 
    'Business Anlyst', 
    'Architect', 'QA Tester', 
    'Project Manager']

    num1 = 5;
    num2 = 2;
    sum = this.num1 + this.num2;
    multply = this.num1 * this.num2;

    get summation (){
        return (this.num1 +  this.num2) + this.multply;
    }

    get desiredTitle(){
        return this.titles[5];
    }
}
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    employeeName = 'Samet POLAT' ;
    experience = 40 ;
    fruits = ['Apple', 'Orange', 'Grape', 'Cherry'];
    oddNumbers = [3,5,7,9];
    location = {
        city: "Kocaeli",
        country: "Turkey",
        state : "Basiskele"
    }

}
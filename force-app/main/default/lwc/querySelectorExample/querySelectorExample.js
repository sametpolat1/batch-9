import { LightningElement } from 'lwc';

export default class QuerySelectorExample extends LightningElement {
    fruits = ['apple', 'orange', 'banana'];

    clickHandler(event){
        // To modify single component
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        elem.style.border = '2px solid green';
        elem.style.background = 'red';

        // To modify multiple component
        const fruitElem = this.template.querySelectorAll('.fruit');
        fruitElem.forEach(item => {
            console.log(item.innerText);
            item.setAttribute('class','slds-align_absolute-center');
            item.style.background = 'green';
        });


    }
}
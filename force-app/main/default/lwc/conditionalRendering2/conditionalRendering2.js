import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showContent = false;
    label = ' Show Content';
    handleClick(event){ // parametre almadığımız icin evente gerek yok.
       if(this.showContent){
        this.showContent = false;
        this.label = 'Show Content';
       }else{
        this.showContent = true;
        this.label = 'Hide Content';
       }
       
       // this.showContent = true;
    }
}
import { LightningElement } from 'lwc';

export default class CalculatorAssignment extends LightningElement {

num1=0;
num2=0;


handleChange1(event){
    this.num1 = event.target.value;
    console.log(event.target.value);
}


handleChange2(event){
    this.num2 = event.target.value;
    console.log(event.target.value);
}
 
get toplamdeger(){
   
    return Number(this.num1) +  Number(this.num2);

}
}
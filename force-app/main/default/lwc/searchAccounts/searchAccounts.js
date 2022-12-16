import { LightningElement } from 'lwc';
import searchAccountsByName from '@salesforce/apex/AccountController.searchAccountsByName';

export default class SearchAccounts extends LightningElement {

    searchWord;
    accounts;
    error;

//this method will be invoked from html when any key is typed
    searchHandler(event){
        this.searchWord=event.target.value;
        if(this.searchWord.length >2 ) {
            //imperative method will always have return type as Promise
            searchAccountsByName({searchKeyword:this.searchWord})
            .then(result =>{
                console.log(result);
                this.accounts = result;
            })
            .catch(error =>{
                console.log(error);
                this.error = error;

            })
        }
    }

}
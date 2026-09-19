import { LightningElement,wire } from 'lwc';
import getListOfAcc from '@salesforce/apex/AccountController.getAccountList';
export default class ApexWireMethodToFunction1 extends LightningElement {
    Accounts;
    error;
    @wire(getListOfAcc) 
    wiredAccounts({data,error}){
     if(data){
        this.Accounts = data;
        this.error = undefined;
     }
     else if(error ){
        this.error = error;
        this.Accounts = undefined;
     }
    }
}
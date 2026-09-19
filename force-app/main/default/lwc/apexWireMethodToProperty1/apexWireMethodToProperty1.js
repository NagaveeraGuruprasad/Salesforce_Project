import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

export default class ApexWireMethodToProperty1 extends LightningElement {

    @wire(getAccountList) Accounts;
}
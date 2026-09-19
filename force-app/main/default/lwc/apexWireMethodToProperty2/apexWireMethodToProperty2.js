import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
export default class ApexWireMethodToProperty2 extends LightningElement {

     @wire(getContactList) Contacts;
}
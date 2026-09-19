import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
export default class ApexImperativeMethodV1 extends LightningElement {

    contactList;
    error;
    async handleLoad(){
        try{
            console.log('Fetched getContactList:', getContactList);
            const result = await getContactList();
            console.log('Fetched result:', result);
            this.contactList = result;
            this.error = undefined;
        }
        catch(error){
             this.contactList = undefined;
             this.error = error;
             
        }
    }
}
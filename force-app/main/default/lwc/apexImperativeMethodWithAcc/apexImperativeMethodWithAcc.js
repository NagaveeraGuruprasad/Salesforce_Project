import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccountList';
export default class ApexImperativeMethodWithAcc extends LightningElement {

    accountsData;
    error;
  async LoadAccount() {
        try{
            console.log=('fetchAccountsData:',getAccounts);
            this.accountsData = await getAccounts();
            console.log=('fetchAccountsData:',getAccounts());
            this.error = undefined;
        } catch (error){
            this.accountsData = undefined;
            this.error = error;
        }
    }

}
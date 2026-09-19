import { LightningElement, wire } from 'lwc';
import getOppsList from '@salesforce/apex/OpportunityController.getOpportunityList';

export default class ApexWireMethodToFunctionOpps extends LightningElement {
oppsList;
error;
    @wire(getOppsList)
   wiredOpportunities({error, data}){
             if(data){
               this.oppsList = data;
               this.error = undefined;
             }  else if (error){
               this.error = error; 
               this.oppsList = undefined;
             }             

   }
}
import { LightningElement, wire } from 'lwc';
import getOppsList from '@salesforce/apex/OpportunityController.getOpportunityList';

export default class ApexWireMethodToPropertyOpps extends LightningElement {
    @wire (getOppsList) OppsList;

}
import { LightningElement } from 'lwc';

export default class HelloConditionalRendering2 extends LightningElement {
    showmask = false;

    handlechange(event){
        this.showmask = event.target.checked;
        console.log('showmask value is :'+this.showmask);
       
    }
}
import { LightningElement } from 'lwc';

export default class HelloBinding1 extends LightningElement {
    WelcomeLWC = 'LWCWorld';

    handlechange(event){
        this.WelcomeLWC = event.target.value;

    }
}
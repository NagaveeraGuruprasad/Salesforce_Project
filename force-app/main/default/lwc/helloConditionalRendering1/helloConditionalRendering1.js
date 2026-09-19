import { LightningElement } from 'lwc';

export default class HelloConditionalRendering1 extends LightningElement {
    areDetailsVisible =false;
    MarkChekbox(event){
        this.areDetailsVisible = event.target.checked
    }
}
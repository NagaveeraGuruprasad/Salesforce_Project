import { LightningElement } from 'lwc';

export default class HelloForEach1 extends LightningElement {
    areDetailsVisible = false;
    handlechange(event){
        this.areDetailsVisible = event.target.checked;
        console.log('areDetailsVisible value is:'+areDetailsVisible );
    }

    eoList = [
        {
          Id: 1,
          Name: 'Marc Benioff',
          Company: 'Salesforce.com',
      },
      {
          Id: 2,
          Name: 'Sundar Pichai',
          Company: 'Google',
      },
    
      {
          Id: 3,
          Name: 'Elon Musk',
          Company: 'Telsa',
      },
  ];
}
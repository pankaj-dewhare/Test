import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub';


const columns = [
   // { label: 'Passport Id', fieldName: 'Name', editable: true },
    { label: 'Passport Number', fieldName: 'Passport_No__c', editable: true },
    { label: 'Status', fieldName: 'Status__c', editable: true },
    { label: 'Created Date', fieldName: 'CreatedDate', editable: true }
  ];
  
export default class PassportCompoSub extends LightningElement {
    
    
    passlist = 'waiting...';
    draftValues=[];
    columns = columns
    

    connectedCallback(){
        this.receivedDataHandler()
    }

    receivedDataHandler(){
        pubsub.subscribe("eventName" , (message) => {
           this.passlist = message
        });
    }

}
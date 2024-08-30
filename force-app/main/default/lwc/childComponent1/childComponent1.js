import { LightningElement } from 'lwc';

export default class ChildComponent1 extends LightningElement {

    parentMessage = 'I am a salesforce developer';

    handleSendDataButton(){
        const myNewEvent = new CustomEvent("myChildEvent", {
            detail : this.parentMessage
            });
            this.dispatchEvent(myNewEvent);
            
    }
    
}
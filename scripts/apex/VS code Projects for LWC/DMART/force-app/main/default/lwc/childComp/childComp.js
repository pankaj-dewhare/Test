import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {

    childMessage = 'I am salesforce developer';

    handleSendDataButton(){
        const myEvent = new CustomEvent("mychildevent", {
            detail : this.childMessage
            });
            this.dispatchEvent(myEvent);
            
    }
}
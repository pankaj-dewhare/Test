import { LightningElement } from 'lwc';

export default class ChilComponent extends LightningElement {

    messageToParent = 'Hi Parent Compo';

    sendDataToPArentHandler(){

        const myEvent = new CustomEvent("newparentevent", {
            detail : this.messageToParent
            });
            this.dispatchEvent(myEvent);
            
    }
}
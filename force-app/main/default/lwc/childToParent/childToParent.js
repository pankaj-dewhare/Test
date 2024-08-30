import { LightningElement } from 'lwc';

export default class ChildToParent extends LightningElement {

    parentMessage = 'Hi, How are you? \n Team Airtel';

    sendButtonHandler(){

        const myEvent = new CustomEvent("eventname",{
            detail : this.parentMessage
        });

        this.dispatchEvent(myEvent);

    }
            
    }
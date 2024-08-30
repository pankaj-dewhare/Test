import { LightningElement } from 'lwc';

export default class MyChildComponent extends LightningElement {

    popUpHandler(){
        const myEvent = new CustomEvent("showpopupevent", {
            detail : false
            });
            this.dispatchEvent(myEvent);
            
    }
}
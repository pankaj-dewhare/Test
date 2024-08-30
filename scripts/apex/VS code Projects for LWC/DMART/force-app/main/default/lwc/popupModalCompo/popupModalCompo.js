import { LightningElement } from 'lwc';

export default class PopupModalCompo extends LightningElement {


    closeButtonHandler(){

        const myEvent = new CustomEvent("mychildevent", {
            detail : false
            });
            this.dispatchEvent(myEvent);
            
    }
}
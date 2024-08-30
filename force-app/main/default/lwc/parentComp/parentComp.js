import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {

    childMessage = 'Waiting for child message';

    handleJSMethod(event){

        this.childMessage = event.detail
    }
}